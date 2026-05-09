; DESCRIPTION: Renders a black line between points (293, 110) and (431, 81).
; PLAN: r0=293(x1), r1=110(y1), r2=431(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 110
LDI r2, 431
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
