; DESCRIPTION: Renders a black disk with center (320, 132) and radius 48.
; PLAN: r0=320(x), r1=132(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 132
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
