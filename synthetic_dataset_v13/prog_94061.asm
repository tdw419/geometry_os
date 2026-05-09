; DESCRIPTION: Draws a purple line from (262, 97) to (435, 80).
; PLAN: r0=262(x1), r1=97(y1), r2=435(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 97
LDI r2, 435
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
