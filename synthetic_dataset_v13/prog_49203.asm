; DESCRIPTION: Places a black line segment connecting (471, 253) to (457, 109).
; PLAN: r0=471(x1), r1=253(y1), r2=457(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 253
LDI r2, 457
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
