; DESCRIPTION: Renders a orange line between points (475, 17) and (249, 140).
; PLAN: r0=475(x1), r1=17(y1), r2=249(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 17
LDI r2, 249
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
