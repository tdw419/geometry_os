; DESCRIPTION: Draws a purple line from (39, 196) to (369, 206).
; PLAN: r0=39(x1), r1=196(y1), r2=369(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 196
LDI r2, 369
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
