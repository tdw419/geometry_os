; DESCRIPTION: Renders a orange line between points (403, 62) and (133, 179).
; PLAN: r0=403(x1), r1=62(y1), r2=133(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 62
LDI r2, 133
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
