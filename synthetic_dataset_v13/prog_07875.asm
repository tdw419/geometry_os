; DESCRIPTION: Draws a magenta line from (485, 29) to (150, 11).
; PLAN: r0=485(x1), r1=29(y1), r2=150(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 29
LDI r2, 150
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
