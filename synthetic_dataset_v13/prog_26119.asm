; DESCRIPTION: Renders a orange line between points (87, 184) and (262, 28).
; PLAN: r0=87(x1), r1=184(y1), r2=262(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 184
LDI r2, 262
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
