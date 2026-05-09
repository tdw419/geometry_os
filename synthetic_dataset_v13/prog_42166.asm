; DESCRIPTION: Renders a cyan line between points (136, 50) and (183, 201).
; PLAN: r0=136(x1), r1=50(y1), r2=183(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 50
LDI r2, 183
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
