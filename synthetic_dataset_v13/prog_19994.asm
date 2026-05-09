; DESCRIPTION: Places a blue line segment connecting (136, 32) to (330, 181).
; PLAN: r0=136(x1), r1=32(y1), r2=330(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 32
LDI r2, 330
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
