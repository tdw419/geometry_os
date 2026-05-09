; DESCRIPTION: Draws a blue line from (232, 125) to (72, 207).
; PLAN: r0=232(x1), r1=125(y1), r2=72(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 125
LDI r2, 72
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
