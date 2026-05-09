; DESCRIPTION: Renders a magenta line between points (49, 172) and (351, 67).
; PLAN: r0=49(x1), r1=172(y1), r2=351(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 172
LDI r2, 351
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
