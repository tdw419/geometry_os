; DESCRIPTION: Renders a orange line between points (42, 217) and (323, 17).
; PLAN: r0=42(x1), r1=217(y1), r2=323(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 217
LDI r2, 323
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
