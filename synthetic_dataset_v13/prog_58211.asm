; DESCRIPTION: Renders a purple line between points (203, 24) and (108, 61).
; PLAN: r0=203(x1), r1=24(y1), r2=108(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 24
LDI r2, 108
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
