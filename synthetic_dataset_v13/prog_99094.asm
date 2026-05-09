; DESCRIPTION: Draws a black line from (181, 217) to (501, 248).
; PLAN: r0=181(x1), r1=217(y1), r2=501(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 217
LDI r2, 501
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
