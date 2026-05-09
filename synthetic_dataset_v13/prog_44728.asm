; DESCRIPTION: Places a blue line segment connecting (215, 49) to (353, 15).
; PLAN: r0=215(x1), r1=49(y1), r2=353(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 49
LDI r2, 353
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
