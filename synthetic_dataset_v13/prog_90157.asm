; DESCRIPTION: Renders a purple line between points (363, 117) and (303, 254).
; PLAN: r0=363(x1), r1=117(y1), r2=303(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 117
LDI r2, 303
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
