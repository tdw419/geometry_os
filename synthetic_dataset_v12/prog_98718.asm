; DESCRIPTION: Draws a purple line from (175, 142) to (429, 162).
; PLAN: r0=175(x1), r1=142(y1), r2=429(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 142
LDI r2, 429
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
