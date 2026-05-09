; DESCRIPTION: Draws a purple line from (246, 124) to (422, 123).
; PLAN: r0=246(x1), r1=124(y1), r2=422(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 124
LDI r2, 422
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
