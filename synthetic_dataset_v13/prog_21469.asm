; DESCRIPTION: Renders a orange line between points (316, 255) and (231, 6).
; PLAN: r0=316(x1), r1=255(y1), r2=231(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 255
LDI r2, 231
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
