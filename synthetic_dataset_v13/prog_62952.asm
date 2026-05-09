; DESCRIPTION: Renders a magenta line between points (231, 169) and (247, 25).
; PLAN: r0=231(x1), r1=169(y1), r2=247(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 169
LDI r2, 247
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
