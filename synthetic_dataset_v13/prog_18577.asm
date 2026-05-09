; DESCRIPTION: Renders a blue line between points (494, 135) and (496, 124).
; PLAN: r0=494(x1), r1=135(y1), r2=496(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 135
LDI r2, 496
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
