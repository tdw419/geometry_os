; DESCRIPTION: Renders a orange line between points (119, 87) and (148, 143).
; PLAN: r0=119(x1), r1=87(y1), r2=148(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 87
LDI r2, 148
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
