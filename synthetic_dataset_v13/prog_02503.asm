; DESCRIPTION: Renders a purple line between points (395, 172) and (357, 57).
; PLAN: r0=395(x1), r1=172(y1), r2=357(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 172
LDI r2, 357
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
