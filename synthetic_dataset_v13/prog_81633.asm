; DESCRIPTION: Draws a purple line from (33, 60) to (357, 44).
; PLAN: r0=33(x1), r1=60(y1), r2=357(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 60
LDI r2, 357
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
