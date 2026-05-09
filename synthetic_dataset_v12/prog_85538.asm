; DESCRIPTION: Draws a orange line from (80, 217) to (261, 128).
; PLAN: r0=80(x1), r1=217(y1), r2=261(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 217
LDI r2, 261
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
