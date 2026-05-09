; DESCRIPTION: Draws a purple line from (297, 175) to (202, 84).
; PLAN: r0=297(x1), r1=175(y1), r2=202(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 175
LDI r2, 202
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
