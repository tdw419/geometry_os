; DESCRIPTION: Draws a blue line from (376, 230) to (220, 233).
; PLAN: r0=376(x1), r1=230(y1), r2=220(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 230
LDI r2, 220
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
