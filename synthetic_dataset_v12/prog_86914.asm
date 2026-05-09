; DESCRIPTION: Renders a cyan line between points (357, 76) and (139, 230).
; PLAN: r0=357(x1), r1=76(y1), r2=139(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 76
LDI r2, 139
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
