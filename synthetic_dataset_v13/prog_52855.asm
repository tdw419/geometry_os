; DESCRIPTION: Draws a purple line from (59, 53) to (72, 60).
; PLAN: r0=59(x1), r1=53(y1), r2=72(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 53
LDI r2, 72
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
