; DESCRIPTION: Draws a orange line from (123, 75) to (38, 14).
; PLAN: r0=123(x1), r1=75(y1), r2=38(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 75
LDI r2, 38
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
