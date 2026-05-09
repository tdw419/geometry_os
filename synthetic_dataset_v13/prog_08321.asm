; DESCRIPTION: Draws a purple line from (249, 206) to (332, 39).
; PLAN: r0=249(x1), r1=206(y1), r2=332(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 206
LDI r2, 332
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
