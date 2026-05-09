; DESCRIPTION: Renders a green disk with center (100, 194) and radius 62.
; PLAN: r0=100(x), r1=194(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 194
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
