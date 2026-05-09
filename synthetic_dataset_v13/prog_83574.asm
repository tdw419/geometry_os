; DESCRIPTION: Places a black line segment connecting (244, 35) to (316, 62).
; PLAN: r0=244(x1), r1=35(y1), r2=316(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 35
LDI r2, 316
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
