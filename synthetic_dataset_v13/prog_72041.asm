; DESCRIPTION: Renders a red line between points (212, 99) and (378, 101).
; PLAN: r0=212(x1), r1=99(y1), r2=378(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 99
LDI r2, 378
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
