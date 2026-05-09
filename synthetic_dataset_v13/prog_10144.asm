; DESCRIPTION: Renders a purple line between points (251, 48) and (40, 253).
; PLAN: r0=251(x1), r1=48(y1), r2=40(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 48
LDI r2, 40
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
