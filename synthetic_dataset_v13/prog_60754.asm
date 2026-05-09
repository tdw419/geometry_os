; DESCRIPTION: Renders a magenta line between points (106, 188) and (118, 169).
; PLAN: r0=106(x1), r1=188(y1), r2=118(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 188
LDI r2, 118
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
