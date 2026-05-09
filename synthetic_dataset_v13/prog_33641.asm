; DESCRIPTION: Draws a purple line from (482, 209) to (217, 105).
; PLAN: r0=482(x1), r1=209(y1), r2=217(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 209
LDI r2, 217
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
