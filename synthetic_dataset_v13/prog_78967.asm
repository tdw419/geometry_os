; DESCRIPTION: Renders a orange line between points (165, 60) and (308, 109).
; PLAN: r0=165(x1), r1=60(y1), r2=308(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 60
LDI r2, 308
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
