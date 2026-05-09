; DESCRIPTION: Places a blue line segment connecting (130, 88) to (434, 199).
; PLAN: r0=130(x1), r1=88(y1), r2=434(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 88
LDI r2, 434
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
