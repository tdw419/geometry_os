; DESCRIPTION: Draws a purple line from (19, 210) to (319, 11).
; PLAN: r0=19(x1), r1=210(y1), r2=319(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 210
LDI r2, 319
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
