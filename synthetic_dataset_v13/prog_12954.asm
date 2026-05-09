; DESCRIPTION: Renders a black disk with center (220, 143) and radius 53.
; PLAN: r0=220(x), r1=143(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 143
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
