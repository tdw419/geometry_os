; DESCRIPTION: Draws a orange line from (315, 159) to (210, 216).
; PLAN: r0=315(x1), r1=159(y1), r2=210(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 159
LDI r2, 210
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
