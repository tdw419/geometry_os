; DESCRIPTION: Places a orange line segment connecting (365, 165) to (456, 251).
; PLAN: r0=365(x1), r1=165(y1), r2=456(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 165
LDI r2, 456
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
