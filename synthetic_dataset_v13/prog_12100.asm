; DESCRIPTION: Renders a yellow line between points (13, 170) and (433, 132).
; PLAN: r0=13(x1), r1=170(y1), r2=433(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 170
LDI r2, 433
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
