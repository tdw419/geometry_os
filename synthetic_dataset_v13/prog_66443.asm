; DESCRIPTION: Renders a magenta line between points (381, 165) and (274, 206).
; PLAN: r0=381(x1), r1=165(y1), r2=274(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 165
LDI r2, 274
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
