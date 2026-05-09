; DESCRIPTION: Renders a purple line between points (318, 226) and (458, 108).
; PLAN: r0=318(x1), r1=226(y1), r2=458(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 226
LDI r2, 458
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
