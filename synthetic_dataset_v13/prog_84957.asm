; DESCRIPTION: Places a black line segment connecting (78, 198) to (472, 206).
; PLAN: r0=78(x1), r1=198(y1), r2=472(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 198
LDI r2, 472
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
