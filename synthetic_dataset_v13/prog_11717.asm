; DESCRIPTION: Draws a purple line from (142, 123) to (216, 215).
; PLAN: r0=142(x1), r1=123(y1), r2=216(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 123
LDI r2, 216
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
