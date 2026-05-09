; DESCRIPTION: Draws a magenta line from (485, 23) to (159, 222).
; PLAN: r0=485(x1), r1=23(y1), r2=159(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 23
LDI r2, 159
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
