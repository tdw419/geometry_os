; DESCRIPTION: Places a orange line segment connecting (276, 243) to (287, 10).
; PLAN: r0=276(x1), r1=243(y1), r2=287(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 243
LDI r2, 287
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
