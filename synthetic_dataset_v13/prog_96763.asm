; DESCRIPTION: Renders a magenta line between points (274, 20) and (498, 194).
; PLAN: r0=274(x1), r1=20(y1), r2=498(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 20
LDI r2, 498
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
