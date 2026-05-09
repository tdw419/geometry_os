; DESCRIPTION: Places a orange line segment connecting (179, 182) to (17, 168).
; PLAN: r0=179(x1), r1=182(y1), r2=17(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 182
LDI r2, 17
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
