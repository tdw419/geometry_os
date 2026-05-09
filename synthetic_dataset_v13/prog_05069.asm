; DESCRIPTION: Draws a orange line from (61, 134) to (218, 25).
; PLAN: r0=61(x1), r1=134(y1), r2=218(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 134
LDI r2, 218
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
