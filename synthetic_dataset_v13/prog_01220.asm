; DESCRIPTION: Renders a green line between points (402, 76) and (256, 118).
; PLAN: r0=402(x1), r1=76(y1), r2=256(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 76
LDI r2, 256
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
