; DESCRIPTION: Renders a yellow line between points (501, 170) and (475, 153).
; PLAN: r0=501(x1), r1=170(y1), r2=475(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 170
LDI r2, 475
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
