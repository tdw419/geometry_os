; DESCRIPTION: Renders a orange line between points (3, 56) and (380, 185).
; PLAN: r0=3(x1), r1=56(y1), r2=380(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 56
LDI r2, 380
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
