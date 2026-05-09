; DESCRIPTION: Renders a orange line between points (79, 61) and (138, 109).
; PLAN: r0=79(x1), r1=61(y1), r2=138(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 61
LDI r2, 138
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
