; DESCRIPTION: Draws a purple line from (354, 162) to (80, 162).
; PLAN: r0=354(x1), r1=162(y1), r2=80(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 162
LDI r2, 80
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
