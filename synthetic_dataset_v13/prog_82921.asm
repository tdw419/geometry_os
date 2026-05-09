; DESCRIPTION: Places a red line segment connecting (494, 161) to (93, 156).
; PLAN: r0=494(x1), r1=161(y1), r2=93(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 161
LDI r2, 93
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
