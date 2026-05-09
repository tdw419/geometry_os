; DESCRIPTION: Places a black line segment connecting (181, 244) to (24, 203).
; PLAN: r0=181(x1), r1=244(y1), r2=24(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 244
LDI r2, 24
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
