; DESCRIPTION: Draws a purple line from (449, 7) to (400, 204).
; PLAN: r0=449(x1), r1=7(y1), r2=400(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 7
LDI r2, 400
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
