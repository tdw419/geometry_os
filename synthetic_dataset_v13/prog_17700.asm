; DESCRIPTION: Renders a purple line between points (159, 45) and (116, 249).
; PLAN: r0=159(x1), r1=45(y1), r2=116(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 45
LDI r2, 116
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
