; DESCRIPTION: Renders a black disk with center (387, 132) and radius 74.
; PLAN: r0=387(x), r1=132(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 132
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
