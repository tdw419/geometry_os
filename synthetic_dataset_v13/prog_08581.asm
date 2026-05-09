; DESCRIPTION: Renders a orange line between points (50, 133) and (424, 59).
; PLAN: r0=50(x1), r1=133(y1), r2=424(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 133
LDI r2, 424
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
