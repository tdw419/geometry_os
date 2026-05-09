; DESCRIPTION: Draws a purple line from (87, 235) to (324, 0).
; PLAN: r0=87(x1), r1=235(y1), r2=324(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 235
LDI r2, 324
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
