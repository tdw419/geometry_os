; DESCRIPTION: Renders a magenta line between points (274, 177) and (200, 163).
; PLAN: r0=274(x1), r1=177(y1), r2=200(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 177
LDI r2, 200
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
