; DESCRIPTION: Renders a purple line between points (317, 236) and (71, 61).
; PLAN: r0=317(x1), r1=236(y1), r2=71(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 236
LDI r2, 71
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
