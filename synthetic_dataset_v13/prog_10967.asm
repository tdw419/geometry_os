; DESCRIPTION: Draws a orange line from (103, 57) to (149, 149).
; PLAN: r0=103(x1), r1=57(y1), r2=149(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 57
LDI r2, 149
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
