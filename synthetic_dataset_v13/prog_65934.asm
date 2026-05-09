; DESCRIPTION: Draws a orange line from (354, 122) to (388, 148).
; PLAN: r0=354(x1), r1=122(y1), r2=388(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 122
LDI r2, 388
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
