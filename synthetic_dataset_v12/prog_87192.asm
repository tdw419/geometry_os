; DESCRIPTION: Renders a black disk with center (344, 196) and radius 48.
; PLAN: r0=344(x), r1=196(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 196
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
