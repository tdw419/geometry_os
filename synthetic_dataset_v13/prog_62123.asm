; DESCRIPTION: Renders a magenta line between points (54, 248) and (205, 122).
; PLAN: r0=54(x1), r1=248(y1), r2=205(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 248
LDI r2, 205
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
