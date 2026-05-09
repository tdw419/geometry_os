; DESCRIPTION: Draws a orange line from (278, 250) to (103, 100).
; PLAN: r0=278(x1), r1=250(y1), r2=103(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 250
LDI r2, 103
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
