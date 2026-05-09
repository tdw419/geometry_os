; DESCRIPTION: Renders a black line between points (166, 12) and (137, 122).
; PLAN: r0=166(x1), r1=12(y1), r2=137(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 12
LDI r2, 137
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
