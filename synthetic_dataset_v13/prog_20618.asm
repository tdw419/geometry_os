; DESCRIPTION: Renders a black line between points (311, 160) and (98, 101).
; PLAN: r0=311(x1), r1=160(y1), r2=98(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 160
LDI r2, 98
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
