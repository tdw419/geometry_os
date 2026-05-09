; DESCRIPTION: Renders a purple line between points (426, 212) and (275, 191).
; PLAN: r0=426(x1), r1=212(y1), r2=275(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 212
LDI r2, 275
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
