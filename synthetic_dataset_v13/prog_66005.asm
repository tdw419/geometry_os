; DESCRIPTION: Renders a yellow line between points (231, 40) and (93, 194).
; PLAN: r0=231(x1), r1=40(y1), r2=93(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 40
LDI r2, 93
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
