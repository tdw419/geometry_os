; DESCRIPTION: Composite: Renders a yellow line between points (306, 173) and (407, 149) then Sets a single red pixel at (160, 77).
; PLAN: r0=306(x1), r1=173(y1), r2=407(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=77(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 306
LDI r1, 173
LDI r2, 407
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 77
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
