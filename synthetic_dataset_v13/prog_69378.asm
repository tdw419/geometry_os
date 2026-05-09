; DESCRIPTION: Draws a orange line from (469, 128) to (145, 90).
; PLAN: r0=469(x1), r1=128(y1), r2=145(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 128
LDI r2, 145
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
