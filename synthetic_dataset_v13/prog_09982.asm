; DESCRIPTION: Draws a orange line from (136, 5) to (150, 5).
; PLAN: r0=136(x1), r1=5(y1), r2=150(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 5
LDI r2, 150
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
