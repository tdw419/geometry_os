; DESCRIPTION: Draws a black line from (485, 52) to (81, 135).
; PLAN: r0=485(x1), r1=52(y1), r2=81(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 52
LDI r2, 81
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
