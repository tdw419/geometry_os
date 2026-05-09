; DESCRIPTION: Draws a orange line from (12, 248) to (108, 123).
; PLAN: r0=12(x1), r1=248(y1), r2=108(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 248
LDI r2, 108
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
