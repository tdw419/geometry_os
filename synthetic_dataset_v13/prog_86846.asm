; DESCRIPTION: Renders a green line between points (492, 154) and (375, 183).
; PLAN: r0=492(x1), r1=154(y1), r2=375(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 154
LDI r2, 375
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
