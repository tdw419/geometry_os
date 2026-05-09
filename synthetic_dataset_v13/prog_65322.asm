; DESCRIPTION: Draws a orange line from (372, 67) to (106, 103).
; PLAN: r0=372(x1), r1=67(y1), r2=106(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 67
LDI r2, 106
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
