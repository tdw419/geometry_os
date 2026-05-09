; DESCRIPTION: Draws a purple line from (437, 122) to (354, 222).
; PLAN: r0=437(x1), r1=122(y1), r2=354(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 122
LDI r2, 354
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
