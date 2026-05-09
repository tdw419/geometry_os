; DESCRIPTION: Renders a orange line between points (431, 61) and (194, 234).
; PLAN: r0=431(x1), r1=61(y1), r2=194(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 61
LDI r2, 194
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
