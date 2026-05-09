; DESCRIPTION: Draws a purple line from (319, 19) to (409, 228).
; PLAN: r0=319(x1), r1=19(y1), r2=409(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 19
LDI r2, 409
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
