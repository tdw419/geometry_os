; DESCRIPTION: Draws a purple line from (130, 210) to (212, 216).
; PLAN: r0=130(x1), r1=210(y1), r2=212(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 210
LDI r2, 212
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
