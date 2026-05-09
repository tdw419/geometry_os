; DESCRIPTION: Draws a purple line from (455, 52) to (266, 117).
; PLAN: r0=455(x1), r1=52(y1), r2=266(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 52
LDI r2, 266
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
