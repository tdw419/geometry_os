; DESCRIPTION: Draws a orange line from (501, 103) to (134, 120).
; PLAN: r0=501(x1), r1=103(y1), r2=134(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 103
LDI r2, 134
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
