; DESCRIPTION: Places a black line segment connecting (457, 17) to (14, 107).
; PLAN: r0=457(x1), r1=17(y1), r2=14(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 17
LDI r2, 14
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
