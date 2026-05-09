; DESCRIPTION: Places a black line segment connecting (227, 240) to (122, 236).
; PLAN: r0=227(x1), r1=240(y1), r2=122(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 240
LDI r2, 122
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
