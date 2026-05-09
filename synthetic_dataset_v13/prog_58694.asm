; DESCRIPTION: Draws a magenta line from (485, 56) to (134, 1).
; PLAN: r0=485(x1), r1=56(y1), r2=134(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 56
LDI r2, 134
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
