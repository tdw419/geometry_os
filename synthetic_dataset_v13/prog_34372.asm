; DESCRIPTION: Renders a magenta line between points (177, 71) and (200, 227).
; PLAN: r0=177(x1), r1=71(y1), r2=200(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 71
LDI r2, 200
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
