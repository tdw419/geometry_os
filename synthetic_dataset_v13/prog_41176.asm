; DESCRIPTION: Places a blue line segment connecting (343, 167) to (409, 130).
; PLAN: r0=343(x1), r1=167(y1), r2=409(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 167
LDI r2, 409
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
