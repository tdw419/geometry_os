; DESCRIPTION: Draws a blue line from (160, 12) to (357, 121).
; PLAN: r0=160(x1), r1=12(y1), r2=357(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 12
LDI r2, 357
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
