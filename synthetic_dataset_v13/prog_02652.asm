; DESCRIPTION: Renders a green line between points (64, 123) and (58, 238).
; PLAN: r0=64(x1), r1=123(y1), r2=58(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 123
LDI r2, 58
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
