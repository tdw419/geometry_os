; DESCRIPTION: Draws a yellow line from (216, 170) to (339, 71).
; PLAN: r0=216(x1), r1=170(y1), r2=339(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 170
LDI r2, 339
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
