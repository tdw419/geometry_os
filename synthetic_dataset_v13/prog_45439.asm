; DESCRIPTION: Renders a cyan line between points (501, 252) and (184, 179).
; PLAN: r0=501(x1), r1=252(y1), r2=184(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 252
LDI r2, 184
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
