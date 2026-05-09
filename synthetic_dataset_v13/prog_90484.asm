; DESCRIPTION: Places a black line segment connecting (122, 248) to (342, 122).
; PLAN: r0=122(x1), r1=248(y1), r2=342(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 248
LDI r2, 342
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
