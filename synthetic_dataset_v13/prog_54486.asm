; DESCRIPTION: Places a black line segment connecting (505, 72) to (499, 211).
; PLAN: r0=505(x1), r1=72(y1), r2=499(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 72
LDI r2, 499
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
