; DESCRIPTION: Places a black line segment connecting (296, 49) to (484, 239).
; PLAN: r0=296(x1), r1=49(y1), r2=484(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 49
LDI r2, 484
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
