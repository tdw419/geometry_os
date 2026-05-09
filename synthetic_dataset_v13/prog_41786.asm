; DESCRIPTION: Renders a yellow line between points (82, 198) and (78, 245).
; PLAN: r0=82(x1), r1=198(y1), r2=78(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 198
LDI r2, 78
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
