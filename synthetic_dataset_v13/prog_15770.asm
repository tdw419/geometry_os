; DESCRIPTION: Draws a purple line from (285, 157) to (111, 95).
; PLAN: r0=285(x1), r1=157(y1), r2=111(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 157
LDI r2, 111
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
