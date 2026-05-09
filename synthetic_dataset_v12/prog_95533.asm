; DESCRIPTION: Renders a green line between points (135, 170) and (473, 105).
; PLAN: r0=135(x1), r1=170(y1), r2=473(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 170
LDI r2, 473
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
