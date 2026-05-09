; DESCRIPTION: Draws a purple line from (266, 151) to (400, 202).
; PLAN: r0=266(x1), r1=151(y1), r2=400(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 151
LDI r2, 400
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
