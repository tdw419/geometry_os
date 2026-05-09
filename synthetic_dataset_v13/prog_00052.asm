; DESCRIPTION: Draws a orange line from (485, 55) to (429, 172).
; PLAN: r0=485(x1), r1=55(y1), r2=429(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 55
LDI r2, 429
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
