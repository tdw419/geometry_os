; DESCRIPTION: Places a red line segment connecting (296, 10) to (319, 232).
; PLAN: r0=296(x1), r1=10(y1), r2=319(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 10
LDI r2, 319
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
