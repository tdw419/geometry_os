; DESCRIPTION: Draws a orange line from (296, 60) to (282, 133).
; PLAN: r0=296(x1), r1=60(y1), r2=282(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 60
LDI r2, 282
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
