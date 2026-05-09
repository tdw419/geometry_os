; DESCRIPTION: Draws a yellow line from (355, 102) to (452, 13).
; PLAN: r0=355(x1), r1=102(y1), r2=452(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 102
LDI r2, 452
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
