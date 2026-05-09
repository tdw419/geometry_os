; DESCRIPTION: Draws a purple line from (319, 87) to (475, 88).
; PLAN: r0=319(x1), r1=87(y1), r2=475(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 87
LDI r2, 475
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
