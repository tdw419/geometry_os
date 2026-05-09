; DESCRIPTION: Draws a orange line from (411, 44) to (89, 224).
; PLAN: r0=411(x1), r1=44(y1), r2=89(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 44
LDI r2, 89
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
