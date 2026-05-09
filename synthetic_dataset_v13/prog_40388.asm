; DESCRIPTION: Places a blue line segment connecting (136, 83) to (54, 29).
; PLAN: r0=136(x1), r1=83(y1), r2=54(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 83
LDI r2, 54
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
