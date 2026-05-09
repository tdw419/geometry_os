; DESCRIPTION: Renders a orange line between points (360, 58) and (79, 101).
; PLAN: r0=360(x1), r1=58(y1), r2=79(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 58
LDI r2, 79
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
