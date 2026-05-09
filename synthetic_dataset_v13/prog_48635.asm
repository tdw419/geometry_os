; DESCRIPTION: Draws a red line from (485, 189) to (388, 199).
; PLAN: r0=485(x1), r1=189(y1), r2=388(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 189
LDI r2, 388
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
