; DESCRIPTION: Draws a purple line from (247, 211) to (113, 250).
; PLAN: r0=247(x1), r1=211(y1), r2=113(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 211
LDI r2, 113
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
