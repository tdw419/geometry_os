; DESCRIPTION: Draws a black line from (428, 227) to (176, 102).
; PLAN: r0=428(x1), r1=227(y1), r2=176(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 227
LDI r2, 176
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
