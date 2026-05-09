; DESCRIPTION: Draws a orange line from (37, 60) to (142, 5).
; PLAN: r0=37(x1), r1=60(y1), r2=142(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 60
LDI r2, 142
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
