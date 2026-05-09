; DESCRIPTION: Places a black line segment connecting (270, 119) to (253, 29).
; PLAN: r0=270(x1), r1=119(y1), r2=253(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 119
LDI r2, 253
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
