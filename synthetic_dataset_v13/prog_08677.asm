; DESCRIPTION: Places a black line segment connecting (254, 241) to (18, 72).
; PLAN: r0=254(x1), r1=241(y1), r2=18(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 241
LDI r2, 18
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
