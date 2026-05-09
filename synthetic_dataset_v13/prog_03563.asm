; DESCRIPTION: Renders a cyan line between points (88, 139) and (105, 54).
; PLAN: r0=88(x1), r1=139(y1), r2=105(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 139
LDI r2, 105
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
