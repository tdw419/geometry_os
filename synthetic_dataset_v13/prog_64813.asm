; DESCRIPTION: Places a orange line segment connecting (296, 14) to (64, 197).
; PLAN: r0=296(x1), r1=14(y1), r2=64(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 14
LDI r2, 64
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
