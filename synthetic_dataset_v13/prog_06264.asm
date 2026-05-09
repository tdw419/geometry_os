; DESCRIPTION: Draws a blue line from (160, 114) to (485, 191).
; PLAN: r0=160(x1), r1=114(y1), r2=485(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 114
LDI r2, 485
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
