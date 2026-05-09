; DESCRIPTION: Draws a black line from (127, 110) to (457, 217).
; PLAN: r0=127(x1), r1=110(y1), r2=457(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 110
LDI r2, 457
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
