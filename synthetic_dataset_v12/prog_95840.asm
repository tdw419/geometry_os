; DESCRIPTION: Places a magenta line segment connecting (139, 227) to (175, 109).
; PLAN: r0=139(x1), r1=227(y1), r2=175(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 227
LDI r2, 175
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
