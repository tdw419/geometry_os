; DESCRIPTION: Draws a blue line from (285, 86) to (15, 246).
; PLAN: r0=285(x1), r1=86(y1), r2=15(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 86
LDI r2, 15
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
