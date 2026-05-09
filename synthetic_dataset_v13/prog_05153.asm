; DESCRIPTION: Draws a purple line from (10, 90) to (186, 166).
; PLAN: r0=10(x1), r1=90(y1), r2=186(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 90
LDI r2, 186
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
