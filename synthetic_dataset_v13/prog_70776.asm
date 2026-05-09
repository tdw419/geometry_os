; DESCRIPTION: Renders a magenta line between points (49, 198) and (62, 52).
; PLAN: r0=49(x1), r1=198(y1), r2=62(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 198
LDI r2, 62
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
