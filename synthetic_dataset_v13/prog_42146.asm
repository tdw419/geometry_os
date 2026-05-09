; DESCRIPTION: Renders a cyan line between points (116, 64) and (158, 191).
; PLAN: r0=116(x1), r1=64(y1), r2=158(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 64
LDI r2, 158
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
