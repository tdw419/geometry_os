; DESCRIPTION: Draws a black line from (278, 115) to (490, 155).
; PLAN: r0=278(x1), r1=115(y1), r2=490(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 115
LDI r2, 490
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
