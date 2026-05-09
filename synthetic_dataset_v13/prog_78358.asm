; DESCRIPTION: Draws a purple line from (366, 220) to (62, 235).
; PLAN: r0=366(x1), r1=220(y1), r2=62(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 220
LDI r2, 62
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
