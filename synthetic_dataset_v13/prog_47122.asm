; DESCRIPTION: Renders a black line between points (467, 187) and (56, 238).
; PLAN: r0=467(x1), r1=187(y1), r2=56(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 187
LDI r2, 56
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
