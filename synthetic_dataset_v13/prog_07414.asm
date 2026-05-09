; DESCRIPTION: Renders a cyan line between points (149, 139) and (370, 102).
; PLAN: r0=149(x1), r1=139(y1), r2=370(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 139
LDI r2, 370
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
