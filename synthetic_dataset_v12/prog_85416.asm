; DESCRIPTION: Renders a cyan line between points (469, 252) and (172, 118).
; PLAN: r0=469(x1), r1=252(y1), r2=172(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 252
LDI r2, 172
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
