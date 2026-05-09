; DESCRIPTION: Draws a orange line from (60, 249) to (12, 100).
; PLAN: r0=60(x1), r1=249(y1), r2=12(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 249
LDI r2, 12
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
