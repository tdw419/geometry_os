; DESCRIPTION: Draws a purple line from (52, 166) to (450, 102).
; PLAN: r0=52(x1), r1=166(y1), r2=450(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 166
LDI r2, 450
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
