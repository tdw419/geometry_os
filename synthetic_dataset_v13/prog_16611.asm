; DESCRIPTION: Renders a magenta line between points (186, 60) and (86, 252).
; PLAN: r0=186(x1), r1=60(y1), r2=86(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 60
LDI r2, 86
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
