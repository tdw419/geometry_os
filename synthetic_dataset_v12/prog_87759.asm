; DESCRIPTION: Draws a orange line from (88, 139) to (442, 6).
; PLAN: r0=88(x1), r1=139(y1), r2=442(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 139
LDI r2, 442
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
