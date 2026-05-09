; DESCRIPTION: Draws a white line from (485, 73) to (505, 22).
; PLAN: r0=485(x1), r1=73(y1), r2=505(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 73
LDI r2, 505
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
