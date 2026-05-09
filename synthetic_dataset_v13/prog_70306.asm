; DESCRIPTION: Places a blue line segment connecting (358, 135) to (349, 237).
; PLAN: r0=358(x1), r1=135(y1), r2=349(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 135
LDI r2, 349
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
