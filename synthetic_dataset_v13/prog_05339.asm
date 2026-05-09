; DESCRIPTION: Renders a purple line between points (445, 191) and (403, 79).
; PLAN: r0=445(x1), r1=191(y1), r2=403(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 191
LDI r2, 403
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
