; DESCRIPTION: Renders a black line between points (331, 225) and (153, 28).
; PLAN: r0=331(x1), r1=225(y1), r2=153(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 225
LDI r2, 153
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
