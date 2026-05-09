; DESCRIPTION: Renders a orange line between points (100, 247) and (22, 255).
; PLAN: r0=100(x1), r1=247(y1), r2=22(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 247
LDI r2, 22
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
