; DESCRIPTION: Renders a black line between points (455, 135) and (201, 253).
; PLAN: r0=455(x1), r1=135(y1), r2=201(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 135
LDI r2, 201
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
