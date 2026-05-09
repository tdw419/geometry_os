; DESCRIPTION: Renders a cyan line between points (38, 158) and (276, 216).
; PLAN: r0=38(x1), r1=158(y1), r2=276(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 158
LDI r2, 276
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
