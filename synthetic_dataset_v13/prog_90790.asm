; DESCRIPTION: Renders a cyan line between points (33, 2) and (116, 158).
; PLAN: r0=33(x1), r1=2(y1), r2=116(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 2
LDI r2, 116
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
