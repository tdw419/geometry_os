; DESCRIPTION: Draws a orange line from (272, 202) to (484, 192).
; PLAN: r0=272(x1), r1=202(y1), r2=484(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 202
LDI r2, 484
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
