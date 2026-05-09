; DESCRIPTION: Renders a orange line between points (59, 55) and (282, 98).
; PLAN: r0=59(x1), r1=55(y1), r2=282(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 55
LDI r2, 282
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
