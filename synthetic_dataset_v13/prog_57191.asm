; DESCRIPTION: Draws a orange line from (310, 2) to (296, 171).
; PLAN: r0=310(x1), r1=2(y1), r2=296(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 2
LDI r2, 296
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
