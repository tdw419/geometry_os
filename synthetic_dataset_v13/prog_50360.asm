; DESCRIPTION: Renders a black line between points (462, 11) and (230, 52).
; PLAN: r0=462(x1), r1=11(y1), r2=230(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 11
LDI r2, 230
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
