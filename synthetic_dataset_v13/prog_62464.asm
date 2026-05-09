; DESCRIPTION: Draws a blue line from (364, 14) to (402, 58).
; PLAN: r0=364(x1), r1=14(y1), r2=402(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 14
LDI r2, 402
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
