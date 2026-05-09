; DESCRIPTION: Renders a purple line between points (265, 139) and (357, 127).
; PLAN: r0=265(x1), r1=139(y1), r2=357(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 139
LDI r2, 357
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
