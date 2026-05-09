; DESCRIPTION: Places a black line segment connecting (252, 218) to (88, 7).
; PLAN: r0=252(x1), r1=218(y1), r2=88(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 218
LDI r2, 88
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
