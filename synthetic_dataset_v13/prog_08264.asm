; DESCRIPTION: Places a orange line segment connecting (437, 235) to (296, 230).
; PLAN: r0=437(x1), r1=235(y1), r2=296(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 235
LDI r2, 296
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
