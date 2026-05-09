; DESCRIPTION: Places a black line segment connecting (2, 237) to (342, 227).
; PLAN: r0=2(x1), r1=237(y1), r2=342(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 237
LDI r2, 342
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
