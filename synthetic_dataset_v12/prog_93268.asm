; DESCRIPTION: Renders a green line between points (156, 34) and (219, 199).
; PLAN: r0=156(x1), r1=34(y1), r2=219(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 34
LDI r2, 219
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
