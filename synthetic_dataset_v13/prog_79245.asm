; DESCRIPTION: Renders a magenta line between points (302, 153) and (118, 169).
; PLAN: r0=302(x1), r1=153(y1), r2=118(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 153
LDI r2, 118
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
