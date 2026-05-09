; DESCRIPTION: Renders a yellow line between points (86, 85) and (49, 189).
; PLAN: r0=86(x1), r1=85(y1), r2=49(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 85
LDI r2, 49
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
