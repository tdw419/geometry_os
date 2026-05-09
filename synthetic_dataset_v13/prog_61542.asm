; DESCRIPTION: Renders a magenta line between points (485, 15) and (76, 217).
; PLAN: r0=485(x1), r1=15(y1), r2=76(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 15
LDI r2, 76
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
