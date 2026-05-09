; DESCRIPTION: Places a green line segment connecting (366, 169) to (21, 136).
; PLAN: r0=366(x1), r1=169(y1), r2=21(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 169
LDI r2, 21
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
