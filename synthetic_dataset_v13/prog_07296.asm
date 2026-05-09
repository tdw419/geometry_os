; DESCRIPTION: Draws a purple line from (216, 209) to (94, 86).
; PLAN: r0=216(x1), r1=209(y1), r2=94(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 209
LDI r2, 94
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
