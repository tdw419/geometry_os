; DESCRIPTION: Draws a purple line from (285, 206) to (65, 84).
; PLAN: r0=285(x1), r1=206(y1), r2=65(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 206
LDI r2, 65
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
