; DESCRIPTION: Renders a black line between points (369, 205) and (184, 114).
; PLAN: r0=369(x1), r1=205(y1), r2=184(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 205
LDI r2, 184
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
