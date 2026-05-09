; DESCRIPTION: Renders a magenta line between points (191, 217) and (20, 252).
; PLAN: r0=191(x1), r1=217(y1), r2=20(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 217
LDI r2, 20
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
