; DESCRIPTION: Places a blue line segment connecting (181, 129) to (101, 80).
; PLAN: r0=181(x1), r1=129(y1), r2=101(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 129
LDI r2, 101
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
