; DESCRIPTION: Draws a purple line from (313, 244) to (170, 170).
; PLAN: r0=313(x1), r1=244(y1), r2=170(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 244
LDI r2, 170
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
