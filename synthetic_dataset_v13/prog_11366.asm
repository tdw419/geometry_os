; DESCRIPTION: Draws a blue line from (296, 167) to (85, 198).
; PLAN: r0=296(x1), r1=167(y1), r2=85(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 167
LDI r2, 85
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
