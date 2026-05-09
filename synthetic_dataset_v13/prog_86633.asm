; DESCRIPTION: Draws a purple line from (459, 157) to (120, 202).
; PLAN: r0=459(x1), r1=157(y1), r2=120(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 157
LDI r2, 120
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
