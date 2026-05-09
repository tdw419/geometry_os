; DESCRIPTION: Renders a red line between points (452, 156) and (437, 220).
; PLAN: r0=452(x1), r1=156(y1), r2=437(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 156
LDI r2, 437
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
