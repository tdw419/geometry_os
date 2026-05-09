; DESCRIPTION: Draws a purple line from (126, 187) to (442, 85).
; PLAN: r0=126(x1), r1=187(y1), r2=442(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 187
LDI r2, 442
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
