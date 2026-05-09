; DESCRIPTION: Draws a yellow line from (424, 88) to (435, 233).
; PLAN: r0=424(x1), r1=88(y1), r2=435(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 88
LDI r2, 435
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
