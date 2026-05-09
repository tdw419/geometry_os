; DESCRIPTION: Places a black line segment connecting (244, 88) to (250, 19).
; PLAN: r0=244(x1), r1=88(y1), r2=250(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 88
LDI r2, 250
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
