; DESCRIPTION: Renders a green line between points (161, 246) and (52, 40).
; PLAN: r0=161(x1), r1=246(y1), r2=52(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 246
LDI r2, 52
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
