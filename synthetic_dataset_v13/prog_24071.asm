; DESCRIPTION: Draws a orange line from (45, 25) to (300, 69).
; PLAN: r0=45(x1), r1=25(y1), r2=300(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 25
LDI r2, 300
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
