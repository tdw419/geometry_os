; DESCRIPTION: Places a black line segment connecting (275, 22) to (254, 109).
; PLAN: r0=275(x1), r1=22(y1), r2=254(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 22
LDI r2, 254
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
