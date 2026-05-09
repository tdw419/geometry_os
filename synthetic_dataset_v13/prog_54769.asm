; DESCRIPTION: Draws a purple line from (23, 58) to (436, 162).
; PLAN: r0=23(x1), r1=58(y1), r2=436(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 58
LDI r2, 436
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
