; DESCRIPTION: Places a orange line segment connecting (17, 182) to (57, 105).
; PLAN: r0=17(x1), r1=182(y1), r2=57(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 182
LDI r2, 57
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
