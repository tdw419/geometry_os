; DESCRIPTION: Draws a yellow line from (462, 74) to (416, 232).
; PLAN: r0=462(x1), r1=74(y1), r2=416(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 74
LDI r2, 416
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
