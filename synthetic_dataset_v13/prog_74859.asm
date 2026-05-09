; DESCRIPTION: Draws a red line from (240, 170) to (0, 99).
; PLAN: r0=240(x1), r1=170(y1), r2=0(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 170
LDI r2, 0
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
