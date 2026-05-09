; DESCRIPTION: Renders a green line between points (166, 20) and (62, 249).
; PLAN: r0=166(x1), r1=20(y1), r2=62(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 20
LDI r2, 62
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
