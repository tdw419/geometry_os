; DESCRIPTION: Renders a purple line between points (367, 116) and (246, 94).
; PLAN: r0=367(x1), r1=116(y1), r2=246(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 116
LDI r2, 246
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
