; DESCRIPTION: Places a orange line segment connecting (296, 208) to (14, 138).
; PLAN: r0=296(x1), r1=208(y1), r2=14(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 208
LDI r2, 14
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
