; DESCRIPTION: Draws a orange line from (485, 16) to (496, 33).
; PLAN: r0=485(x1), r1=16(y1), r2=496(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 16
LDI r2, 496
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
