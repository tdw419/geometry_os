; DESCRIPTION: Places a black line segment connecting (505, 138) to (203, 254).
; PLAN: r0=505(x1), r1=138(y1), r2=203(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 138
LDI r2, 203
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
