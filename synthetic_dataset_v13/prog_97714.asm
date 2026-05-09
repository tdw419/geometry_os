; DESCRIPTION: Renders a yellow line between points (1, 170) and (244, 177).
; PLAN: r0=1(x1), r1=170(y1), r2=244(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 170
LDI r2, 244
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
