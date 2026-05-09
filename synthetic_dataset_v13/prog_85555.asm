; DESCRIPTION: Draws a orange line from (416, 172) to (431, 151).
; PLAN: r0=416(x1), r1=172(y1), r2=431(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 172
LDI r2, 431
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
