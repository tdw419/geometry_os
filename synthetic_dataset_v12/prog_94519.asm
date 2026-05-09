; DESCRIPTION: Draws a orange line from (75, 188) to (69, 28).
; PLAN: r0=75(x1), r1=188(y1), r2=69(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 188
LDI r2, 69
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
