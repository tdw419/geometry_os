; DESCRIPTION: Places a black line segment connecting (109, 66) to (43, 123).
; PLAN: r0=109(x1), r1=66(y1), r2=43(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 66
LDI r2, 43
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
