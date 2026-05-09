; DESCRIPTION: Draws a purple line from (413, 246) to (211, 172).
; PLAN: r0=413(x1), r1=246(y1), r2=211(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 246
LDI r2, 211
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
