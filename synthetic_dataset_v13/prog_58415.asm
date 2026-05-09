; DESCRIPTION: Draws a orange line from (475, 120) to (1, 25).
; PLAN: r0=475(x1), r1=120(y1), r2=1(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 120
LDI r2, 1
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
