; DESCRIPTION: Places a black line segment connecting (34, 189) to (36, 211).
; PLAN: r0=34(x1), r1=189(y1), r2=36(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 189
LDI r2, 36
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
