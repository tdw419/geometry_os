; DESCRIPTION: Renders a green disk with center (161, 64) and radius 24.
; PLAN: r0=161(x), r1=64(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 64
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
