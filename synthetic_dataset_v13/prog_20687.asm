; DESCRIPTION: Renders a purple line between points (98, 114) and (289, 172).
; PLAN: r0=98(x1), r1=114(y1), r2=289(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 114
LDI r2, 289
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
