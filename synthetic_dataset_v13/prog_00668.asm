; DESCRIPTION: Draws a purple line from (111, 19) to (475, 231).
; PLAN: r0=111(x1), r1=19(y1), r2=475(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 19
LDI r2, 475
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
