; DESCRIPTION: Renders a cyan line between points (314, 158) and (57, 109).
; PLAN: r0=314(x1), r1=158(y1), r2=57(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 158
LDI r2, 57
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
