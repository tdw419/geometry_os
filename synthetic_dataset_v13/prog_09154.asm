; DESCRIPTION: Draws a purple line from (222, 23) to (412, 51).
; PLAN: r0=222(x1), r1=23(y1), r2=412(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 23
LDI r2, 412
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
