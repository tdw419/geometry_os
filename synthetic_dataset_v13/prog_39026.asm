; DESCRIPTION: Places a black line segment connecting (62, 159) to (323, 219).
; PLAN: r0=62(x1), r1=159(y1), r2=323(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 159
LDI r2, 323
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
