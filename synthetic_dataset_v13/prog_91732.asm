; DESCRIPTION: Renders a magenta line between points (274, 142) and (40, 177).
; PLAN: r0=274(x1), r1=142(y1), r2=40(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 142
LDI r2, 40
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
