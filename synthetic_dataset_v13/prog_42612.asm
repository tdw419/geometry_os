; DESCRIPTION: Places a black line segment connecting (68, 150) to (223, 245).
; PLAN: r0=68(x1), r1=150(y1), r2=223(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 150
LDI r2, 223
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
