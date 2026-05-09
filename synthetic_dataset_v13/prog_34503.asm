; DESCRIPTION: Renders a yellow line between points (164, 252) and (49, 62).
; PLAN: r0=164(x1), r1=252(y1), r2=49(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 252
LDI r2, 49
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
