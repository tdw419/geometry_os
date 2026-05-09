; DESCRIPTION: Draws a black line from (296, 101) to (181, 135).
; PLAN: r0=296(x1), r1=101(y1), r2=181(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 101
LDI r2, 181
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
