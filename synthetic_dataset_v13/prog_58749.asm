; DESCRIPTION: Draws a purple line from (344, 196) to (349, 130).
; PLAN: r0=344(x1), r1=196(y1), r2=349(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 196
LDI r2, 349
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
