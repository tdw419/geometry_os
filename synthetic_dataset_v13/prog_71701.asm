; DESCRIPTION: Draws a purple line from (11, 97) to (437, 59).
; PLAN: r0=11(x1), r1=97(y1), r2=437(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 97
LDI r2, 437
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
