; DESCRIPTION: Renders a cyan line between points (140, 24) and (116, 179).
; PLAN: r0=140(x1), r1=24(y1), r2=116(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 24
LDI r2, 116
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
