; DESCRIPTION: Renders a purple line between points (71, 191) and (467, 71).
; PLAN: r0=71(x1), r1=191(y1), r2=467(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 191
LDI r2, 467
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
