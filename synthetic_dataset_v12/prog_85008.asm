; DESCRIPTION: Renders a red line between points (62, 23) and (452, 105).
; PLAN: r0=62(x1), r1=23(y1), r2=452(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 23
LDI r2, 452
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
