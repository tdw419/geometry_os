; DESCRIPTION: Draws a purple line from (187, 224) to (455, 158).
; PLAN: r0=187(x1), r1=224(y1), r2=455(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 224
LDI r2, 455
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
