; DESCRIPTION: Places a black line segment connecting (71, 192) to (219, 129).
; PLAN: r0=71(x1), r1=192(y1), r2=219(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 192
LDI r2, 219
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
