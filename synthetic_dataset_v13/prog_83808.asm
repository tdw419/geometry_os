; DESCRIPTION: Renders a green line between points (106, 246) and (409, 224).
; PLAN: r0=106(x1), r1=246(y1), r2=409(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 246
LDI r2, 409
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
