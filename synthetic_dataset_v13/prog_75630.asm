; DESCRIPTION: Renders a magenta line between points (122, 83) and (312, 90).
; PLAN: r0=122(x1), r1=83(y1), r2=312(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 83
LDI r2, 312
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
