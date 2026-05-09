; DESCRIPTION: Renders a orange line between points (270, 245) and (318, 168).
; PLAN: r0=270(x1), r1=245(y1), r2=318(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 245
LDI r2, 318
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
