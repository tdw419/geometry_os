; DESCRIPTION: Renders a magenta line between points (312, 90) and (478, 29).
; PLAN: r0=312(x1), r1=90(y1), r2=478(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 90
LDI r2, 478
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
