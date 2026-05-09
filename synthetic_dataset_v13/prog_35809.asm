; DESCRIPTION: Renders a cyan line between points (89, 195) and (314, 74).
; PLAN: r0=89(x1), r1=195(y1), r2=314(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 195
LDI r2, 314
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
