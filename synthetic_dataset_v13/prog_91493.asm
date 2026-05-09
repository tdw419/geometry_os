; DESCRIPTION: Draws a orange line from (263, 53) to (485, 91).
; PLAN: r0=263(x1), r1=53(y1), r2=485(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 53
LDI r2, 485
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
