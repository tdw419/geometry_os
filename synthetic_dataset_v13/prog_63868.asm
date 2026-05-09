; DESCRIPTION: Renders a orange line between points (137, 247) and (373, 200).
; PLAN: r0=137(x1), r1=247(y1), r2=373(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 247
LDI r2, 373
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
