; DESCRIPTION: Draws a blue line from (444, 232) to (44, 170).
; PLAN: r0=444(x1), r1=232(y1), r2=44(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 232
LDI r2, 44
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
