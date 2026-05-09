; DESCRIPTION: Draws a orange line from (231, 53) to (50, 0).
; PLAN: r0=231(x1), r1=53(y1), r2=50(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 53
LDI r2, 50
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
