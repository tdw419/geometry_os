; DESCRIPTION: Renders a cyan line between points (9, 91) and (297, 212).
; PLAN: r0=9(x1), r1=91(y1), r2=297(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 91
LDI r2, 297
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
