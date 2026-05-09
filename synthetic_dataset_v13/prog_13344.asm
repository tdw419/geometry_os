; DESCRIPTION: Draws a purple line from (256, 160) to (170, 216).
; PLAN: r0=256(x1), r1=160(y1), r2=170(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 160
LDI r2, 170
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
