; DESCRIPTION: Draws a yellow line from (19, 66) to (296, 106).
; PLAN: r0=19(x1), r1=66(y1), r2=296(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 66
LDI r2, 296
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
