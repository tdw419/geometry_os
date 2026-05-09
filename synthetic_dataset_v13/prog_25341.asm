; DESCRIPTION: Draws a orange line from (444, 193) to (471, 46).
; PLAN: r0=444(x1), r1=193(y1), r2=471(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 193
LDI r2, 471
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
