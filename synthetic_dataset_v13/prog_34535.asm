; DESCRIPTION: Renders a green line between points (409, 170) and (97, 132).
; PLAN: r0=409(x1), r1=170(y1), r2=97(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 170
LDI r2, 97
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
