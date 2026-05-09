; DESCRIPTION: Renders a orange line between points (249, 255) and (418, 85).
; PLAN: r0=249(x1), r1=255(y1), r2=418(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 255
LDI r2, 418
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
