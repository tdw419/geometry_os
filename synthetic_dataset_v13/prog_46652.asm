; DESCRIPTION: Draws a purple line from (39, 62) to (189, 13).
; PLAN: r0=39(x1), r1=62(y1), r2=189(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 62
LDI r2, 189
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
