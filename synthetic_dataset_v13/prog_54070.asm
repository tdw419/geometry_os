; DESCRIPTION: Renders a orange line between points (249, 189) and (321, 2).
; PLAN: r0=249(x1), r1=189(y1), r2=321(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 189
LDI r2, 321
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
