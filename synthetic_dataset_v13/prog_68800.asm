; DESCRIPTION: Places a black line segment connecting (454, 185) to (36, 159).
; PLAN: r0=454(x1), r1=185(y1), r2=36(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 185
LDI r2, 36
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
