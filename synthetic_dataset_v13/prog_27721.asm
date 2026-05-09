; DESCRIPTION: Renders a green disk with center (32, 217) and radius 18.
; PLAN: r0=32(x), r1=217(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 217
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
