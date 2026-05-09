; DESCRIPTION: Renders a yellow line between points (496, 48) and (288, 217).
; PLAN: r0=496(x1), r1=48(y1), r2=288(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 48
LDI r2, 288
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
