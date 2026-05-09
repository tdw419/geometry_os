; DESCRIPTION: Renders a blue line between points (39, 43) and (338, 137).
; PLAN: r0=39(x1), r1=43(y1), r2=338(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 43
LDI r2, 338
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
