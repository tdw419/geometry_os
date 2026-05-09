; DESCRIPTION: Renders a black line between points (453, 170) and (58, 117).
; PLAN: r0=453(x1), r1=170(y1), r2=58(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 170
LDI r2, 58
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
