; DESCRIPTION: Draws a orange line from (99, 244) to (139, 91).
; PLAN: r0=99(x1), r1=244(y1), r2=139(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 244
LDI r2, 139
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
