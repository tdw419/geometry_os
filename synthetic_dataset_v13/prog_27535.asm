; DESCRIPTION: Renders a cyan line between points (190, 186) and (116, 0).
; PLAN: r0=190(x1), r1=186(y1), r2=116(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 186
LDI r2, 116
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
