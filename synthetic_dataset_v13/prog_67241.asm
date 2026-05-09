; DESCRIPTION: Renders a black line between points (385, 244) and (257, 222).
; PLAN: r0=385(x1), r1=244(y1), r2=257(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 244
LDI r2, 257
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
