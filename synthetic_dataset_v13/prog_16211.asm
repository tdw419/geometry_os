; DESCRIPTION: Renders a magenta line between points (451, 203) and (297, 39).
; PLAN: r0=451(x1), r1=203(y1), r2=297(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 203
LDI r2, 297
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
