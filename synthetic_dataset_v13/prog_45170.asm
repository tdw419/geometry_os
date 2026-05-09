; DESCRIPTION: Draws a blue line from (51, 24) to (485, 47).
; PLAN: r0=51(x1), r1=24(y1), r2=485(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 24
LDI r2, 485
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
