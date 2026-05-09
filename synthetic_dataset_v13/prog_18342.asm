; DESCRIPTION: Draws a orange line from (28, 23) to (74, 223).
; PLAN: r0=28(x1), r1=23(y1), r2=74(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 23
LDI r2, 74
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
