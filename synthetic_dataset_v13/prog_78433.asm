; DESCRIPTION: Draws a orange line from (313, 72) to (170, 104).
; PLAN: r0=313(x1), r1=72(y1), r2=170(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 72
LDI r2, 170
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
