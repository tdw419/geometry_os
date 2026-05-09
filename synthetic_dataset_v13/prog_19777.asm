; DESCRIPTION: Renders a orange line between points (377, 12) and (296, 248).
; PLAN: r0=377(x1), r1=12(y1), r2=296(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 12
LDI r2, 296
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
