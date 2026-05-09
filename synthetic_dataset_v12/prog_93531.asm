; DESCRIPTION: Draws a purple line from (499, 210) to (233, 135).
; PLAN: r0=499(x1), r1=210(y1), r2=233(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 210
LDI r2, 233
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
