; DESCRIPTION: Draws a orange line from (138, 51) to (457, 61).
; PLAN: r0=138(x1), r1=51(y1), r2=457(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 51
LDI r2, 457
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
