; DESCRIPTION: Draws a black line from (226, 170) to (204, 163).
; PLAN: r0=226(x1), r1=170(y1), r2=204(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 170
LDI r2, 204
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
