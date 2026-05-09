; DESCRIPTION: Draws a red line from (343, 119) to (485, 125).
; PLAN: r0=343(x1), r1=119(y1), r2=485(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 119
LDI r2, 485
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
