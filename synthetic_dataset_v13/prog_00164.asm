; DESCRIPTION: Draws a purple line from (434, 113) to (296, 43).
; PLAN: r0=434(x1), r1=113(y1), r2=296(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 113
LDI r2, 296
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
