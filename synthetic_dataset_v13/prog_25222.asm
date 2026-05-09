; DESCRIPTION: Draws a purple line from (435, 73) to (362, 160).
; PLAN: r0=435(x1), r1=73(y1), r2=362(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 73
LDI r2, 362
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
