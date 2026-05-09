; DESCRIPTION: Renders a orange line between points (439, 205) and (262, 112).
; PLAN: r0=439(x1), r1=205(y1), r2=262(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 205
LDI r2, 262
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
