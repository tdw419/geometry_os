; DESCRIPTION: Renders a magenta line between points (170, 217) and (184, 96).
; PLAN: r0=170(x1), r1=217(y1), r2=184(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 217
LDI r2, 184
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
