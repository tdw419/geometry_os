; DESCRIPTION: Composite: Places a orange line segment connecting (38, 70) to (155, 200) then Sets a single purple pixel at (102, 100).
; PLAN: r0=38(x1), r1=70(y1), r2=155(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=100(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 70
LDI r2, 155
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 100
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
