; DESCRIPTION: Draws a orange line from (193, 47) to (88, 45).
; PLAN: r0=193(x1), r1=47(y1), r2=88(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 47
LDI r2, 88
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
