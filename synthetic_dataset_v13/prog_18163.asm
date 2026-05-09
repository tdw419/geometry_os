; DESCRIPTION: Renders a purple line between points (373, 211) and (363, 71).
; PLAN: r0=373(x1), r1=211(y1), r2=363(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 211
LDI r2, 363
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
