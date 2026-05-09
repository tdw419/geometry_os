; DESCRIPTION: Draws a orange line from (383, 119) to (320, 94).
; PLAN: r0=383(x1), r1=119(y1), r2=320(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 119
LDI r2, 320
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
