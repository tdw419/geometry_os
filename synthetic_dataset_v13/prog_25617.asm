; DESCRIPTION: Draws a magenta line from (375, 33) to (485, 27).
; PLAN: r0=375(x1), r1=33(y1), r2=485(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 33
LDI r2, 485
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
