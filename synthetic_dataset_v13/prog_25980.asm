; DESCRIPTION: Renders a magenta line between points (14, 145) and (75, 148).
; PLAN: r0=14(x1), r1=145(y1), r2=75(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 145
LDI r2, 75
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
