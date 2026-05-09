; DESCRIPTION: Places a blue line segment connecting (92, 198) to (291, 63).
; PLAN: r0=92(x1), r1=198(y1), r2=291(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 198
LDI r2, 291
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
