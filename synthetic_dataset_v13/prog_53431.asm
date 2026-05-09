; DESCRIPTION: Renders a purple line between points (212, 56) and (114, 39).
; PLAN: r0=212(x1), r1=56(y1), r2=114(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 56
LDI r2, 114
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
