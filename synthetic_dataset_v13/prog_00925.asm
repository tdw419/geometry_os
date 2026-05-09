; DESCRIPTION: Draws a black line from (78, 158) to (37, 56).
; PLAN: r0=78(x1), r1=158(y1), r2=37(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 158
LDI r2, 37
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
