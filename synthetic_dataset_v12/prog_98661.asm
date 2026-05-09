; DESCRIPTION: Renders a green disk with center (282, 116) and radius 30.
; PLAN: r0=282(x), r1=116(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 116
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
