; DESCRIPTION: Draws a orange line from (327, 7) to (3, 184).
; PLAN: r0=327(x1), r1=7(y1), r2=3(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 7
LDI r2, 3
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
