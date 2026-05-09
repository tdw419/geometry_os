; DESCRIPTION: Draws a white line from (112, 25) to (485, 102).
; PLAN: r0=112(x1), r1=25(y1), r2=485(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 25
LDI r2, 485
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
