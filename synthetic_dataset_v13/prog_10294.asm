; DESCRIPTION: Draws a purple line from (176, 141) to (337, 76).
; PLAN: r0=176(x1), r1=141(y1), r2=337(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 141
LDI r2, 337
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
