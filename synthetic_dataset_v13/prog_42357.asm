; DESCRIPTION: Draws a orange line from (321, 161) to (433, 62).
; PLAN: r0=321(x1), r1=161(y1), r2=433(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 161
LDI r2, 433
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
