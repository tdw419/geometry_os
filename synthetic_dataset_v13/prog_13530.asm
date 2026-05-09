; DESCRIPTION: Renders a purple line between points (318, 237) and (178, 43).
; PLAN: r0=318(x1), r1=237(y1), r2=178(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 237
LDI r2, 178
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
