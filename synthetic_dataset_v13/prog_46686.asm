; DESCRIPTION: Draws a purple line from (35, 94) to (442, 16).
; PLAN: r0=35(x1), r1=94(y1), r2=442(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 94
LDI r2, 442
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
