; DESCRIPTION: Draws a purple line from (477, 9) to (92, 150).
; PLAN: r0=477(x1), r1=9(y1), r2=92(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 9
LDI r2, 92
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
