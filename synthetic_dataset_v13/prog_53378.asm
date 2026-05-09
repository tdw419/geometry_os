; DESCRIPTION: Renders a orange line between points (318, 111) and (68, 4).
; PLAN: r0=318(x1), r1=111(y1), r2=68(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 111
LDI r2, 68
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
