; DESCRIPTION: Renders a purple line between points (71, 238) and (300, 203).
; PLAN: r0=71(x1), r1=238(y1), r2=300(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 238
LDI r2, 300
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
