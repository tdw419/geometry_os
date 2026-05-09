; DESCRIPTION: Places a blue line segment connecting (198, 219) to (289, 237).
; PLAN: r0=198(x1), r1=219(y1), r2=289(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 219
LDI r2, 289
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
