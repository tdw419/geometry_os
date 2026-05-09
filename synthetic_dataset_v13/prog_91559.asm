; DESCRIPTION: Draws a purple line from (480, 134) to (198, 58).
; PLAN: r0=480(x1), r1=134(y1), r2=198(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 134
LDI r2, 198
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
