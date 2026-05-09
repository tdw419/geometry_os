; DESCRIPTION: Renders a black disk with center (392, 155) and radius 29.
; PLAN: r0=392(x), r1=155(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 155
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
