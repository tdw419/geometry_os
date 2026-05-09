; DESCRIPTION: Renders a magenta line between points (435, 3) and (6, 78).
; PLAN: r0=435(x1), r1=3(y1), r2=6(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 3
LDI r2, 6
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
