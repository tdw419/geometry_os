; DESCRIPTION: Draws a purple line from (39, 208) to (490, 235).
; PLAN: r0=39(x1), r1=208(y1), r2=490(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 208
LDI r2, 490
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
