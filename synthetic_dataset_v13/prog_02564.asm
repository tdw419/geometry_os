; DESCRIPTION: Places a black line segment connecting (239, 55) to (49, 227).
; PLAN: r0=239(x1), r1=55(y1), r2=49(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 55
LDI r2, 49
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
