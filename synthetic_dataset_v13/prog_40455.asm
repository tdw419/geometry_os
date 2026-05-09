; DESCRIPTION: Draws a orange line from (68, 207) to (354, 56).
; PLAN: r0=68(x1), r1=207(y1), r2=354(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 207
LDI r2, 354
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
