; DESCRIPTION: Renders a yellow line between points (219, 240) and (316, 253).
; PLAN: r0=219(x1), r1=240(y1), r2=316(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 240
LDI r2, 316
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
