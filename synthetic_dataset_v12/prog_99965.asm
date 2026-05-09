; DESCRIPTION: Renders a black line between points (32, 234) and (62, 163).
; PLAN: r0=32(x1), r1=234(y1), r2=62(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 234
LDI r2, 62
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
