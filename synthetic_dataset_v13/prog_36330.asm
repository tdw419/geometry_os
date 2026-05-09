; DESCRIPTION: Draws a orange line from (326, 47) to (390, 53).
; PLAN: r0=326(x1), r1=47(y1), r2=390(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 47
LDI r2, 390
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
