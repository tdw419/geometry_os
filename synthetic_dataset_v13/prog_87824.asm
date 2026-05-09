; DESCRIPTION: Draws a black line from (409, 190) to (472, 121).
; PLAN: r0=409(x1), r1=190(y1), r2=472(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 190
LDI r2, 472
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
