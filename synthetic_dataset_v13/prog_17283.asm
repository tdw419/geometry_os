; DESCRIPTION: Renders a green line between points (293, 170) and (300, 163).
; PLAN: r0=293(x1), r1=170(y1), r2=300(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 170
LDI r2, 300
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
