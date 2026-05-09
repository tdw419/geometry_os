; DESCRIPTION: Renders a purple line between points (402, 55) and (9, 253).
; PLAN: r0=402(x1), r1=55(y1), r2=9(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 55
LDI r2, 9
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
