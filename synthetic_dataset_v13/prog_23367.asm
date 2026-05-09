; DESCRIPTION: Draws a purple line from (9, 235) to (260, 204).
; PLAN: r0=9(x1), r1=235(y1), r2=260(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 235
LDI r2, 260
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
