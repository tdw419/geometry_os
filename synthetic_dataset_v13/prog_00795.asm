; DESCRIPTION: Renders a orange line between points (137, 59) and (106, 247).
; PLAN: r0=137(x1), r1=59(y1), r2=106(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 59
LDI r2, 106
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
