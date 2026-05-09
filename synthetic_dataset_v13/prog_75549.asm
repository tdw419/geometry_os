; DESCRIPTION: Places a black line segment connecting (97, 181) to (278, 136).
; PLAN: r0=97(x1), r1=181(y1), r2=278(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 181
LDI r2, 278
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
