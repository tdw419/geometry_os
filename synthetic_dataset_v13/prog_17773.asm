; DESCRIPTION: Draws a purple line from (285, 20) to (181, 21).
; PLAN: r0=285(x1), r1=20(y1), r2=181(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 20
LDI r2, 181
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
