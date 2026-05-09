; DESCRIPTION: Draws a purple line from (337, 36) to (75, 30).
; PLAN: r0=337(x1), r1=36(y1), r2=75(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 36
LDI r2, 75
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
