; DESCRIPTION: Draws a yellow line from (232, 207) to (19, 53).
; PLAN: r0=232(x1), r1=207(y1), r2=19(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 207
LDI r2, 19
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
