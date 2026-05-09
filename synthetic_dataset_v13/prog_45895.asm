; DESCRIPTION: Draws a purple line from (132, 222) to (435, 207).
; PLAN: r0=132(x1), r1=222(y1), r2=435(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 222
LDI r2, 435
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
