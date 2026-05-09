; DESCRIPTION: Draws a blue line from (357, 226) to (115, 47).
; PLAN: r0=357(x1), r1=226(y1), r2=115(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 226
LDI r2, 115
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
