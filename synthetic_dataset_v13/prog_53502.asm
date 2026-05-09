; DESCRIPTION: Renders a orange line between points (472, 24) and (212, 59).
; PLAN: r0=472(x1), r1=24(y1), r2=212(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 24
LDI r2, 212
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
