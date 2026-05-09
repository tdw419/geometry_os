; DESCRIPTION: Renders a green line between points (375, 49) and (212, 183).
; PLAN: r0=375(x1), r1=49(y1), r2=212(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 49
LDI r2, 212
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
