; DESCRIPTION: Draws a purple line from (300, 62) to (469, 59).
; PLAN: r0=300(x1), r1=62(y1), r2=469(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 62
LDI r2, 469
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
