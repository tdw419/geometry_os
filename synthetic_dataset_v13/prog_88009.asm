; DESCRIPTION: Places a blue line segment connecting (442, 1) to (299, 118).
; PLAN: r0=442(x1), r1=1(y1), r2=299(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 1
LDI r2, 299
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
