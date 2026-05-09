; DESCRIPTION: Places a black line segment connecting (101, 95) to (208, 136).
; PLAN: r0=101(x1), r1=95(y1), r2=208(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 95
LDI r2, 208
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
