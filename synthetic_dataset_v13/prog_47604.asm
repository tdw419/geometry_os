; DESCRIPTION: Draws a orange line from (250, 69) to (139, 167).
; PLAN: r0=250(x1), r1=69(y1), r2=139(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 69
LDI r2, 139
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
