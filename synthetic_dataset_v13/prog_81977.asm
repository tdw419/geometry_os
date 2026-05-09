; DESCRIPTION: Places a blue line segment connecting (164, 134) to (124, 130).
; PLAN: r0=164(x1), r1=134(y1), r2=124(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 134
LDI r2, 124
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
