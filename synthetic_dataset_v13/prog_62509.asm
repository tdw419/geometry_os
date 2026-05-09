; DESCRIPTION: Draws a purple line from (442, 46) to (311, 25).
; PLAN: r0=442(x1), r1=46(y1), r2=311(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 46
LDI r2, 311
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
