; DESCRIPTION: Renders a magenta line between points (312, 94) and (72, 141).
; PLAN: r0=312(x1), r1=94(y1), r2=72(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 94
LDI r2, 72
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
