; DESCRIPTION: Draws a red line from (409, 38) to (357, 44).
; PLAN: r0=409(x1), r1=38(y1), r2=357(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 38
LDI r2, 357
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
