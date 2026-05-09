; DESCRIPTION: Renders a purple line between points (303, 191) and (429, 251).
; PLAN: r0=303(x1), r1=191(y1), r2=429(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 191
LDI r2, 429
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
