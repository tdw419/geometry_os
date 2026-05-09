; DESCRIPTION: Draws a purple line from (247, 120) to (75, 3).
; PLAN: r0=247(x1), r1=120(y1), r2=75(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 120
LDI r2, 75
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
