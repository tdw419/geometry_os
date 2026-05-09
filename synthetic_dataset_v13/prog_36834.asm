; DESCRIPTION: Draws a orange line from (437, 162) to (422, 19).
; PLAN: r0=437(x1), r1=162(y1), r2=422(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 162
LDI r2, 422
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
