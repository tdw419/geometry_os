; DESCRIPTION: Places a blue line segment connecting (227, 123) to (293, 130).
; PLAN: r0=227(x1), r1=123(y1), r2=293(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 123
LDI r2, 293
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
