; DESCRIPTION: Places a black line segment connecting (414, 175) to (107, 98).
; PLAN: r0=414(x1), r1=175(y1), r2=107(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 175
LDI r2, 107
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
