; DESCRIPTION: Renders a cyan line between points (95, 104) and (309, 18).
; PLAN: r0=95(x1), r1=104(y1), r2=309(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 104
LDI r2, 309
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
