; DESCRIPTION: Draws a yellow line from (219, 49) to (383, 121).
; PLAN: r0=219(x1), r1=49(y1), r2=383(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 49
LDI r2, 383
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
