; DESCRIPTION: Renders a yellow line between points (58, 234) and (507, 74).
; PLAN: r0=58(x1), r1=234(y1), r2=507(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 234
LDI r2, 507
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
