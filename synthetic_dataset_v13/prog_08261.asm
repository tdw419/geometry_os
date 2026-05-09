; DESCRIPTION: Draws a blue line from (345, 145) to (357, 41).
; PLAN: r0=345(x1), r1=145(y1), r2=357(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 145
LDI r2, 357
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
