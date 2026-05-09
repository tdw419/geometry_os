; DESCRIPTION: Places a blue line segment connecting (402, 38) to (144, 134).
; PLAN: r0=402(x1), r1=38(y1), r2=144(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 38
LDI r2, 144
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
