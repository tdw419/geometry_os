; DESCRIPTION: Renders a purple line between points (499, 238) and (318, 173).
; PLAN: r0=499(x1), r1=238(y1), r2=318(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 238
LDI r2, 318
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
