; DESCRIPTION: Draws a orange line from (355, 162) to (441, 109).
; PLAN: r0=355(x1), r1=162(y1), r2=441(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 162
LDI r2, 441
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
