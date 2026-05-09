; DESCRIPTION: Renders a orange line between points (176, 205) and (24, 116).
; PLAN: r0=176(x1), r1=205(y1), r2=24(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 205
LDI r2, 24
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
