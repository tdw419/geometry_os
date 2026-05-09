; DESCRIPTION: Draws a green line from (115, 170) to (222, 72).
; PLAN: r0=115(x1), r1=170(y1), r2=222(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 170
LDI r2, 222
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
