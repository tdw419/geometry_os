; DESCRIPTION: Renders a magenta line between points (336, 217) and (88, 209).
; PLAN: r0=336(x1), r1=217(y1), r2=88(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 217
LDI r2, 88
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
