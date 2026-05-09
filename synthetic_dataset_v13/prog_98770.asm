; DESCRIPTION: Draws a blue line from (416, 241) to (349, 198).
; PLAN: r0=416(x1), r1=241(y1), r2=349(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 241
LDI r2, 349
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
