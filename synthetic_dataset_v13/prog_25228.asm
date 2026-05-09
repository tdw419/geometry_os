; DESCRIPTION: Renders a green line between points (151, 192) and (131, 98).
; PLAN: r0=151(x1), r1=192(y1), r2=131(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 192
LDI r2, 131
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
