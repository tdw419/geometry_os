; DESCRIPTION: Draws a purple line from (412, 58) to (280, 162).
; PLAN: r0=412(x1), r1=58(y1), r2=280(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 58
LDI r2, 280
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
