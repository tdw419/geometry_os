; DESCRIPTION: Composite: Places a yellow line segment connecting (125, 141) to (7, 158) then Sets a single red pixel at (121, 144).
; PLAN: r0=125(x1), r1=141(y1), r2=7(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=144(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 125
LDI r1, 141
LDI r2, 7
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 144
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
