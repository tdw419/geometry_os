; DESCRIPTION: Draws a blue line from (435, 222) to (137, 58).
; PLAN: r0=435(x1), r1=222(y1), r2=137(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 222
LDI r2, 137
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
