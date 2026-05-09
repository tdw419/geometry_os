; DESCRIPTION: Draws a purple line from (337, 240) to (440, 205).
; PLAN: r0=337(x1), r1=240(y1), r2=440(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 240
LDI r2, 440
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
