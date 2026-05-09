; DESCRIPTION: Renders a cyan line between points (116, 165) and (273, 157).
; PLAN: r0=116(x1), r1=165(y1), r2=273(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 165
LDI r2, 273
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
