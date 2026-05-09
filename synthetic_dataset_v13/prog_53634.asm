; DESCRIPTION: Draws a orange line from (339, 254) to (170, 101).
; PLAN: r0=339(x1), r1=254(y1), r2=170(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 254
LDI r2, 170
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
