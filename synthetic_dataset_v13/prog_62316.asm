; DESCRIPTION: Draws a purple line from (311, 119) to (280, 83).
; PLAN: r0=311(x1), r1=119(y1), r2=280(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 119
LDI r2, 280
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
