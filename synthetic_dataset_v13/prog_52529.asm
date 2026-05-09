; DESCRIPTION: Renders a orange line between points (83, 227) and (148, 238).
; PLAN: r0=83(x1), r1=227(y1), r2=148(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 227
LDI r2, 148
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
