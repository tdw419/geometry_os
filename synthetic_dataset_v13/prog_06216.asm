; DESCRIPTION: Draws a purple line from (19, 245) to (113, 78).
; PLAN: r0=19(x1), r1=245(y1), r2=113(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 245
LDI r2, 113
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
