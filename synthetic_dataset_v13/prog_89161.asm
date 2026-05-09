; DESCRIPTION: Renders a orange line between points (389, 79) and (297, 24).
; PLAN: r0=389(x1), r1=79(y1), r2=297(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 79
LDI r2, 297
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
