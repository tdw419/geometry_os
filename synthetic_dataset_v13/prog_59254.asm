; DESCRIPTION: Renders a yellow line between points (328, 85) and (304, 254).
; PLAN: r0=328(x1), r1=85(y1), r2=304(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 85
LDI r2, 304
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
