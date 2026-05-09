; DESCRIPTION: Renders a black disk with center (344, 114) and radius 63.
; PLAN: r0=344(x), r1=114(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 114
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
