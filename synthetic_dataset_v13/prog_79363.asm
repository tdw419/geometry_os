; DESCRIPTION: Draws a purple line from (493, 201) to (92, 235).
; PLAN: r0=493(x1), r1=201(y1), r2=92(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 201
LDI r2, 92
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
