; DESCRIPTION: Draws a white line from (232, 29) to (312, 197).
; PLAN: r0=232(x1), r1=29(y1), r2=312(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 29
LDI r2, 312
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
