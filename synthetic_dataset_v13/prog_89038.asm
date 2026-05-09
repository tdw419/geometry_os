; DESCRIPTION: Draws a yellow line from (289, 93) to (507, 62).
; PLAN: r0=289(x1), r1=93(y1), r2=507(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 93
LDI r2, 507
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
