; DESCRIPTION: Renders a yellow line between points (380, 131) and (227, 121).
; PLAN: r0=380(x1), r1=131(y1), r2=227(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 131
LDI r2, 227
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
