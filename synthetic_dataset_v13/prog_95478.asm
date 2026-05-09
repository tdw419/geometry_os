; DESCRIPTION: Draws a purple line from (407, 37) to (507, 61).
; PLAN: r0=407(x1), r1=37(y1), r2=507(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 37
LDI r2, 507
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
