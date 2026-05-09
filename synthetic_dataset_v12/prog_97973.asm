; DESCRIPTION: Renders a magenta line between points (274, 96) and (424, 232).
; PLAN: r0=274(x1), r1=96(y1), r2=424(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 96
LDI r2, 424
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
