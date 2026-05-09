; DESCRIPTION: Places a blue line segment connecting (11, 208) to (59, 136).
; PLAN: r0=11(x1), r1=208(y1), r2=59(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 208
LDI r2, 59
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
