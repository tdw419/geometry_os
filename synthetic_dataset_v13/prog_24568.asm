; DESCRIPTION: Draws a orange line from (221, 116) to (296, 144).
; PLAN: r0=221(x1), r1=116(y1), r2=296(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 116
LDI r2, 296
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
