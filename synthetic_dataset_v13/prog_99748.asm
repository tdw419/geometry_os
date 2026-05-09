; DESCRIPTION: Renders a purple line between points (351, 102) and (422, 215).
; PLAN: r0=351(x1), r1=102(y1), r2=422(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 102
LDI r2, 422
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
