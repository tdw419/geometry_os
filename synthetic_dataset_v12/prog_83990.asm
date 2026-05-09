; DESCRIPTION: Renders a magenta line between points (311, 255) and (18, 252).
; PLAN: r0=311(x1), r1=255(y1), r2=18(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 255
LDI r2, 18
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
