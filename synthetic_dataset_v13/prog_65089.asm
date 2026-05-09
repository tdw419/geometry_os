; DESCRIPTION: Renders a cyan line between points (163, 86) and (14, 245).
; PLAN: r0=163(x1), r1=86(y1), r2=14(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 86
LDI r2, 14
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
