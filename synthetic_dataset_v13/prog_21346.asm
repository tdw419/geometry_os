; DESCRIPTION: Renders a magenta line between points (119, 177) and (400, 212).
; PLAN: r0=119(x1), r1=177(y1), r2=400(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 177
LDI r2, 400
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
