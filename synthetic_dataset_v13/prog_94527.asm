; DESCRIPTION: Draws a orange line from (501, 27) to (113, 44).
; PLAN: r0=501(x1), r1=27(y1), r2=113(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 27
LDI r2, 113
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
