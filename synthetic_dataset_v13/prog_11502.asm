; DESCRIPTION: Renders a purple line between points (363, 230) and (267, 62).
; PLAN: r0=363(x1), r1=230(y1), r2=267(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 230
LDI r2, 267
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
