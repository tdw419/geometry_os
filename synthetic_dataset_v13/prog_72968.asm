; DESCRIPTION: Renders a orange line between points (439, 246) and (214, 140).
; PLAN: r0=439(x1), r1=246(y1), r2=214(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 246
LDI r2, 214
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
