; DESCRIPTION: Renders a green disk with center (31, 64) and radius 21.
; PLAN: r0=31(x), r1=64(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 64
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
