; DESCRIPTION: Draws a orange line from (302, 134) to (405, 164).
; PLAN: r0=302(x1), r1=134(y1), r2=405(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 134
LDI r2, 405
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
