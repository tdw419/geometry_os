; DESCRIPTION: Renders a orange line between points (247, 172) and (245, 60).
; PLAN: r0=247(x1), r1=172(y1), r2=245(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 172
LDI r2, 245
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
