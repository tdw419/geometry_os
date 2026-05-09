; DESCRIPTION: Draws a blue line from (385, 39) to (472, 71).
; PLAN: r0=385(x1), r1=39(y1), r2=472(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 39
LDI r2, 472
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
