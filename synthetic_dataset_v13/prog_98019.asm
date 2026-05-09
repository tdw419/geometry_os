; DESCRIPTION: Draws a orange line from (338, 100) to (369, 220).
; PLAN: r0=338(x1), r1=100(y1), r2=369(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 100
LDI r2, 369
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
