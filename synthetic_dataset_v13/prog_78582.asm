; DESCRIPTION: Draws a orange line from (437, 184) to (367, 80).
; PLAN: r0=437(x1), r1=184(y1), r2=367(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 184
LDI r2, 367
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
