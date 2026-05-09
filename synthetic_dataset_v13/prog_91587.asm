; DESCRIPTION: Draws a orange line from (81, 208) to (114, 116).
; PLAN: r0=81(x1), r1=208(y1), r2=114(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 208
LDI r2, 114
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
