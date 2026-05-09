; DESCRIPTION: Renders a orange line between points (477, 69) and (165, 178).
; PLAN: r0=477(x1), r1=69(y1), r2=165(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 69
LDI r2, 165
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
