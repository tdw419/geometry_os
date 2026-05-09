; DESCRIPTION: Draws a purple line from (21, 153) to (321, 26).
; PLAN: r0=21(x1), r1=153(y1), r2=321(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 153
LDI r2, 321
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
