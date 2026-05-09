; DESCRIPTION: Draws a orange line from (62, 111) to (399, 103).
; PLAN: r0=62(x1), r1=111(y1), r2=399(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 111
LDI r2, 399
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
