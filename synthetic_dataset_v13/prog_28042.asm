; DESCRIPTION: Draws a purple line from (20, 58) to (313, 87).
; PLAN: r0=20(x1), r1=58(y1), r2=313(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 58
LDI r2, 313
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
