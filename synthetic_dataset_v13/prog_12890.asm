; DESCRIPTION: Renders a cyan line between points (172, 115) and (37, 206).
; PLAN: r0=172(x1), r1=115(y1), r2=37(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 115
LDI r2, 37
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
