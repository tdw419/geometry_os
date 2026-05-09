; DESCRIPTION: Places a black line segment connecting (343, 17) to (431, 241).
; PLAN: r0=343(x1), r1=17(y1), r2=431(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 17
LDI r2, 431
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
