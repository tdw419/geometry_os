; DESCRIPTION: Renders a green disk with center (72, 96) and radius 23.
; PLAN: r0=72(x), r1=96(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 96
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
