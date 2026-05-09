; DESCRIPTION: Renders a magenta line between points (411, 169) and (177, 19).
; PLAN: r0=411(x1), r1=169(y1), r2=177(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 169
LDI r2, 177
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
