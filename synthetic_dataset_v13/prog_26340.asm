; DESCRIPTION: Draws a purple line from (353, 176) to (387, 81).
; PLAN: r0=353(x1), r1=176(y1), r2=387(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 176
LDI r2, 387
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
