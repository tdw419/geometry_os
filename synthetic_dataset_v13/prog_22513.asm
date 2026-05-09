; DESCRIPTION: Draws a purple line from (337, 93) to (140, 80).
; PLAN: r0=337(x1), r1=93(y1), r2=140(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 93
LDI r2, 140
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
