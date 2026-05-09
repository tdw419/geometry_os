; DESCRIPTION: Draws a orange line from (255, 28) to (390, 157).
; PLAN: r0=255(x1), r1=28(y1), r2=390(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 28
LDI r2, 390
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
