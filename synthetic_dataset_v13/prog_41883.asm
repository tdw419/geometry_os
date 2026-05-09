; DESCRIPTION: Places a black line segment connecting (129, 189) to (191, 101).
; PLAN: r0=129(x1), r1=189(y1), r2=191(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 189
LDI r2, 191
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
