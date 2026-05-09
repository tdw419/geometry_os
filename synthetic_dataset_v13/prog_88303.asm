; DESCRIPTION: Draws a purple line from (329, 115) to (37, 178).
; PLAN: r0=329(x1), r1=115(y1), r2=37(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 115
LDI r2, 37
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
