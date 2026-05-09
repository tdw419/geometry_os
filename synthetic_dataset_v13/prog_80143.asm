; DESCRIPTION: Draws a blue line from (86, 222) to (5, 155).
; PLAN: r0=86(x1), r1=222(y1), r2=5(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 222
LDI r2, 5
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
