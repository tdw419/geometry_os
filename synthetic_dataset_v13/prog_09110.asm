; DESCRIPTION: Renders a orange line between points (414, 142) and (120, 214).
; PLAN: r0=414(x1), r1=142(y1), r2=120(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 142
LDI r2, 120
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
