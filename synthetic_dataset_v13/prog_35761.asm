; DESCRIPTION: Renders a green disk with center (128, 144) and radius 51.
; PLAN: r0=128(x), r1=144(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 144
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
