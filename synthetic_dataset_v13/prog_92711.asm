; DESCRIPTION: Places a purple line segment connecting (398, 64) to (136, 184).
; PLAN: r0=398(x1), r1=64(y1), r2=136(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 64
LDI r2, 136
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
