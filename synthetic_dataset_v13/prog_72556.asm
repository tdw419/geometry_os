; DESCRIPTION: Renders a yellow line between points (310, 170) and (511, 249).
; PLAN: r0=310(x1), r1=170(y1), r2=511(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 170
LDI r2, 511
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
