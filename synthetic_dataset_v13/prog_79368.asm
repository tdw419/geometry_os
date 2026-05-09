; DESCRIPTION: Composite: Draws a yellow line from (90, 138) to (406, 239) then Sets a single orange pixel at (325, 25).
; PLAN: r0=90(x1), r1=138(y1), r2=406(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=25(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 138
LDI r2, 406
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 25
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
