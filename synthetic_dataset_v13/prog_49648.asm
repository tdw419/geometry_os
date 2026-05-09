; DESCRIPTION: Draws a orange line from (169, 14) to (300, 239).
; PLAN: r0=169(x1), r1=14(y1), r2=300(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 14
LDI r2, 300
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
