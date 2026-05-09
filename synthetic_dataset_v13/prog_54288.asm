; DESCRIPTION: Renders a orange line between points (79, 88) and (335, 134).
; PLAN: r0=79(x1), r1=88(y1), r2=335(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 88
LDI r2, 335
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
