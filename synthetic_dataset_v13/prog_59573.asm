; DESCRIPTION: Renders a magenta line between points (376, 11) and (319, 251).
; PLAN: r0=376(x1), r1=11(y1), r2=319(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 11
LDI r2, 319
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
