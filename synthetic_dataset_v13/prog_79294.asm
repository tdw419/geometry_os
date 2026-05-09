; DESCRIPTION: Renders a magenta line between points (186, 88) and (73, 59).
; PLAN: r0=186(x1), r1=88(y1), r2=73(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 88
LDI r2, 73
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
