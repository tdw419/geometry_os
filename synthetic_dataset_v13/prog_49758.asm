; DESCRIPTION: Draws a black line from (44, 123) to (389, 194).
; PLAN: r0=44(x1), r1=123(y1), r2=389(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 123
LDI r2, 389
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
