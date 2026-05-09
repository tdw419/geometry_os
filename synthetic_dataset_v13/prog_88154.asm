; DESCRIPTION: Renders a orange line between points (133, 145) and (450, 59).
; PLAN: r0=133(x1), r1=145(y1), r2=450(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 145
LDI r2, 450
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
