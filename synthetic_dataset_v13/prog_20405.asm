; DESCRIPTION: Renders a black line between points (188, 15) and (3, 29).
; PLAN: r0=188(x1), r1=15(y1), r2=3(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 15
LDI r2, 3
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
