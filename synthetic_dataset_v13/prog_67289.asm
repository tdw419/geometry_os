; DESCRIPTION: Draws a purple line from (183, 10) to (430, 198).
; PLAN: r0=183(x1), r1=10(y1), r2=430(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 10
LDI r2, 430
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
