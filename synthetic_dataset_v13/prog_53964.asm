; DESCRIPTION: Draws a purple line from (477, 87) to (422, 120).
; PLAN: r0=477(x1), r1=87(y1), r2=422(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 87
LDI r2, 422
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
