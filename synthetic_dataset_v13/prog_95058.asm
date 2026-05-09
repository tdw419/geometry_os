; DESCRIPTION: Draws a black line from (258, 227) to (509, 162).
; PLAN: r0=258(x1), r1=227(y1), r2=509(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 227
LDI r2, 509
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
