; DESCRIPTION: Draws a orange line from (313, 142) to (86, 114).
; PLAN: r0=313(x1), r1=142(y1), r2=86(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 142
LDI r2, 86
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
