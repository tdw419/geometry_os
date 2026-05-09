; DESCRIPTION: Draws a orange line from (426, 119) to (138, 144).
; PLAN: r0=426(x1), r1=119(y1), r2=138(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 119
LDI r2, 138
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
