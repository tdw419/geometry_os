; DESCRIPTION: Renders a magenta line between points (266, 97) and (495, 245).
; PLAN: r0=266(x1), r1=97(y1), r2=495(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 97
LDI r2, 495
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
