; DESCRIPTION: Renders a black line between points (58, 136) and (487, 244).
; PLAN: r0=58(x1), r1=136(y1), r2=487(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 136
LDI r2, 487
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
