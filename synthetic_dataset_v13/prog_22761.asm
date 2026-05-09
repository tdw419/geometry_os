; DESCRIPTION: Draws a purple line from (319, 106) to (50, 108).
; PLAN: r0=319(x1), r1=106(y1), r2=50(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 106
LDI r2, 50
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
