; DESCRIPTION: Places a blue line segment connecting (148, 192) to (306, 164).
; PLAN: r0=148(x1), r1=192(y1), r2=306(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 192
LDI r2, 306
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
