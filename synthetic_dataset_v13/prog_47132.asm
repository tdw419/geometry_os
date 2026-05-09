; DESCRIPTION: Draws a orange line from (501, 58) to (230, 116).
; PLAN: r0=501(x1), r1=58(y1), r2=230(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 58
LDI r2, 230
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
