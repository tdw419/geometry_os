; DESCRIPTION: Renders a black disk with center (84, 145) and radius 64.
; PLAN: r0=84(x), r1=145(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 145
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
