; DESCRIPTION: Renders a yellow line between points (376, 85) and (231, 254).
; PLAN: r0=376(x1), r1=85(y1), r2=231(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 85
LDI r2, 231
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
