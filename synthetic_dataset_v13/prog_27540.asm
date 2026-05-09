; DESCRIPTION: Renders a cyan line between points (136, 22) and (432, 139).
; PLAN: r0=136(x1), r1=22(y1), r2=432(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 22
LDI r2, 432
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
