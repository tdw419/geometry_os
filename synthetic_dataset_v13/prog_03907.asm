; DESCRIPTION: Renders a magenta line between points (402, 14) and (319, 1).
; PLAN: r0=402(x1), r1=14(y1), r2=319(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 14
LDI r2, 319
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
