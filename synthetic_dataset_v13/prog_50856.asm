; DESCRIPTION: Renders a magenta line between points (139, 30) and (276, 183).
; PLAN: r0=139(x1), r1=30(y1), r2=276(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 30
LDI r2, 276
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
