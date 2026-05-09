; DESCRIPTION: Draws a purple line from (468, 214) to (409, 67).
; PLAN: r0=468(x1), r1=214(y1), r2=409(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 214
LDI r2, 409
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
