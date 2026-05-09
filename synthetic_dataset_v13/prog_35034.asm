; DESCRIPTION: Renders a black line between points (311, 46) and (475, 105).
; PLAN: r0=311(x1), r1=46(y1), r2=475(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 46
LDI r2, 475
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
