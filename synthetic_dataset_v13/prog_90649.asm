; DESCRIPTION: Renders a green disk with center (189, 156) and radius 16.
; PLAN: r0=189(x), r1=156(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 156
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
