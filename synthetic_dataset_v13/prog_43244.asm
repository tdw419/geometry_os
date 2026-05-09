; DESCRIPTION: Renders a black line between points (7, 12) and (455, 106).
; PLAN: r0=7(x1), r1=12(y1), r2=455(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 12
LDI r2, 455
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
