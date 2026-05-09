; DESCRIPTION: Draws a orange line from (370, 116) to (165, 100).
; PLAN: r0=370(x1), r1=116(y1), r2=165(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 116
LDI r2, 165
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
