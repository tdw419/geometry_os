; DESCRIPTION: Draws a purple line from (7, 67) to (234, 58).
; PLAN: r0=7(x1), r1=67(y1), r2=234(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 67
LDI r2, 234
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
