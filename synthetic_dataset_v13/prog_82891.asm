; DESCRIPTION: Draws a orange line from (426, 128) to (262, 89).
; PLAN: r0=426(x1), r1=128(y1), r2=262(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 128
LDI r2, 262
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
