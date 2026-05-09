; DESCRIPTION: Places a blue line segment connecting (13, 148) to (107, 205).
; PLAN: r0=13(x1), r1=148(y1), r2=107(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 148
LDI r2, 107
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
