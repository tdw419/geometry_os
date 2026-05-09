; DESCRIPTION: Draws a purple line from (52, 194) to (48, 217).
; PLAN: r0=52(x1), r1=194(y1), r2=48(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 194
LDI r2, 48
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
