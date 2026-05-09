; DESCRIPTION: Draws a orange line from (336, 100) to (465, 125).
; PLAN: r0=336(x1), r1=100(y1), r2=465(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 100
LDI r2, 465
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
