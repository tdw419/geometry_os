; DESCRIPTION: Draws a purple line from (116, 162) to (197, 14).
; PLAN: r0=116(x1), r1=162(y1), r2=197(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 162
LDI r2, 197
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
