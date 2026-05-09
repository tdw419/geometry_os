; DESCRIPTION: Draws a orange line from (38, 12) to (475, 7).
; PLAN: r0=38(x1), r1=12(y1), r2=475(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 12
LDI r2, 475
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
