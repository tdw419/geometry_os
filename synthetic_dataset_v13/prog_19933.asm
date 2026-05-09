; DESCRIPTION: Places a orange line segment connecting (361, 8) to (387, 230).
; PLAN: r0=361(x1), r1=8(y1), r2=387(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 8
LDI r2, 387
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
