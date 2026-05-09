; DESCRIPTION: Draws a orange line from (269, 128) to (3, 251).
; PLAN: r0=269(x1), r1=128(y1), r2=3(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 128
LDI r2, 3
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
