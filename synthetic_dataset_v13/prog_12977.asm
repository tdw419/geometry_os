; DESCRIPTION: Renders a orange line between points (321, 39) and (381, 191).
; PLAN: r0=321(x1), r1=39(y1), r2=381(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 39
LDI r2, 381
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
