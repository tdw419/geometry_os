; DESCRIPTION: Places a black line segment connecting (18, 140) to (402, 15).
; PLAN: r0=18(x1), r1=140(y1), r2=402(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 140
LDI r2, 402
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
