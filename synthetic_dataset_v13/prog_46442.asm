; DESCRIPTION: Renders a cyan line between points (192, 104) and (430, 179).
; PLAN: r0=192(x1), r1=104(y1), r2=430(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 104
LDI r2, 430
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
