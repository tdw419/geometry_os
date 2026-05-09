; DESCRIPTION: Renders a magenta line between points (50, 8) and (22, 158).
; PLAN: r0=50(x1), r1=8(y1), r2=22(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 8
LDI r2, 22
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
