; DESCRIPTION: Renders a green disk with center (423, 128) and radius 24.
; PLAN: r0=423(x), r1=128(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 128
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
