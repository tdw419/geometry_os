; DESCRIPTION: Draws a purple line from (373, 213) to (151, 74).
; PLAN: r0=373(x1), r1=213(y1), r2=151(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 213
LDI r2, 151
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
