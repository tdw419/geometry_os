; DESCRIPTION: Draws a green line from (119, 99) to (78, 163).
; PLAN: r0=119(x1), r1=99(y1), r2=78(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 99
LDI r2, 78
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
