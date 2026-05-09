; DESCRIPTION: Draws a orange line from (258, 204) to (471, 46).
; PLAN: r0=258(x1), r1=204(y1), r2=471(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 204
LDI r2, 471
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
