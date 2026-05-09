; DESCRIPTION: Renders a red line between points (55, 85) and (261, 63).
; PLAN: r0=55(x1), r1=85(y1), r2=261(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 85
LDI r2, 261
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
