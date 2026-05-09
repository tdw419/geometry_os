; DESCRIPTION: Renders a cyan line between points (246, 85) and (314, 79).
; PLAN: r0=246(x1), r1=85(y1), r2=314(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 85
LDI r2, 314
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
