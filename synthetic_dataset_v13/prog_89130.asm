; DESCRIPTION: Places a black line segment connecting (296, 188) to (304, 199).
; PLAN: r0=296(x1), r1=188(y1), r2=304(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 188
LDI r2, 304
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
