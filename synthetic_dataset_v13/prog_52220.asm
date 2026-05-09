; DESCRIPTION: Renders a purple line between points (212, 17) and (276, 145).
; PLAN: r0=212(x1), r1=17(y1), r2=276(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 17
LDI r2, 276
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
