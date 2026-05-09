; DESCRIPTION: Places a orange line segment connecting (432, 29) to (206, 139).
; PLAN: r0=432(x1), r1=29(y1), r2=206(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 29
LDI r2, 206
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
