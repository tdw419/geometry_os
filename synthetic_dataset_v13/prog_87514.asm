; DESCRIPTION: Places a blue line segment connecting (12, 22) to (90, 144).
; PLAN: r0=12(x1), r1=22(y1), r2=90(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 22
LDI r2, 90
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
