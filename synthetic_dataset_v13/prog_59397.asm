; DESCRIPTION: Draws a orange line from (90, 58) to (416, 159).
; PLAN: r0=90(x1), r1=58(y1), r2=416(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 58
LDI r2, 416
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
