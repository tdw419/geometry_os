; DESCRIPTION: Renders a yellow line between points (151, 82) and (83, 101).
; PLAN: r0=151(x1), r1=82(y1), r2=83(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 82
LDI r2, 83
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
