; DESCRIPTION: Draws a black line from (490, 161) to (296, 244).
; PLAN: r0=490(x1), r1=161(y1), r2=296(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 161
LDI r2, 296
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
