; DESCRIPTION: Draws a orange line from (22, 83) to (67, 153).
; PLAN: r0=22(x1), r1=83(y1), r2=67(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 83
LDI r2, 67
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
