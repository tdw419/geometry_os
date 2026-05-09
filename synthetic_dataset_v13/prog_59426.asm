; DESCRIPTION: Renders a blue line between points (270, 114) and (4, 253).
; PLAN: r0=270(x1), r1=114(y1), r2=4(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 114
LDI r2, 4
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
