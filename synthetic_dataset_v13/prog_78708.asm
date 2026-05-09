; DESCRIPTION: Draws a purple line from (214, 119) to (426, 207).
; PLAN: r0=214(x1), r1=119(y1), r2=426(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 119
LDI r2, 426
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
