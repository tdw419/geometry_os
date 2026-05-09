; DESCRIPTION: Draws a white line from (204, 34) to (485, 89).
; PLAN: r0=204(x1), r1=34(y1), r2=485(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 34
LDI r2, 485
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
