; DESCRIPTION: Renders a black line between points (85, 44) and (156, 238).
; PLAN: r0=85(x1), r1=44(y1), r2=156(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 44
LDI r2, 156
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
