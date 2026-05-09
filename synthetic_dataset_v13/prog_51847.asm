; DESCRIPTION: Draws a purple line from (209, 229) to (216, 103).
; PLAN: r0=209(x1), r1=229(y1), r2=216(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 229
LDI r2, 216
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
