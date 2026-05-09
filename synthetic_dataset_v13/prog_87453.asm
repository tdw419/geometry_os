; DESCRIPTION: Places a blue line segment connecting (377, 193) to (384, 230).
; PLAN: r0=377(x1), r1=193(y1), r2=384(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 193
LDI r2, 384
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
