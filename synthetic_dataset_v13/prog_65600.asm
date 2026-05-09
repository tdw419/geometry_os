; DESCRIPTION: Renders a magenta line between points (54, 216) and (250, 186).
; PLAN: r0=54(x1), r1=216(y1), r2=250(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 216
LDI r2, 250
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
