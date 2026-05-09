; DESCRIPTION: Draws a purple line from (373, 96) to (329, 141).
; PLAN: r0=373(x1), r1=96(y1), r2=329(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 96
LDI r2, 329
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
