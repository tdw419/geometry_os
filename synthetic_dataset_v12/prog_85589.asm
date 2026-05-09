; DESCRIPTION: Renders a cyan line between points (194, 99) and (318, 238).
; PLAN: r0=194(x1), r1=99(y1), r2=318(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 99
LDI r2, 318
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
