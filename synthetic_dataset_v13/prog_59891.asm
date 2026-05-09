; DESCRIPTION: Draws a purple line from (44, 166) to (16, 133).
; PLAN: r0=44(x1), r1=166(y1), r2=16(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 166
LDI r2, 16
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
