; DESCRIPTION: Renders a magenta line between points (274, 254) and (179, 56).
; PLAN: r0=274(x1), r1=254(y1), r2=179(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 254
LDI r2, 179
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
