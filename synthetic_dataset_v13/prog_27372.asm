; DESCRIPTION: Draws a orange line from (311, 236) to (77, 128).
; PLAN: r0=311(x1), r1=236(y1), r2=77(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 236
LDI r2, 77
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
