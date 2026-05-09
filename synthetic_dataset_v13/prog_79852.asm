; DESCRIPTION: Renders a green line between points (247, 170) and (131, 104).
; PLAN: r0=247(x1), r1=170(y1), r2=131(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 170
LDI r2, 131
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
