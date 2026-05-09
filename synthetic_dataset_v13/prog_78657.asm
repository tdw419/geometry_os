; DESCRIPTION: Places a red line segment connecting (220, 170) to (144, 24).
; PLAN: r0=220(x1), r1=170(y1), r2=144(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 170
LDI r2, 144
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
