; DESCRIPTION: Draws a orange line from (139, 157) to (13, 57).
; PLAN: r0=139(x1), r1=157(y1), r2=13(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 157
LDI r2, 13
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
