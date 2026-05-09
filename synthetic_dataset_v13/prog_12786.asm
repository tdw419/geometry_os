; DESCRIPTION: Places a white line segment connecting (128, 88) to (347, 35).
; PLAN: r0=128(x1), r1=88(y1), r2=347(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 88
LDI r2, 347
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
