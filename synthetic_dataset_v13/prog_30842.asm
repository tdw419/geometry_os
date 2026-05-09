; DESCRIPTION: Renders a green disk with center (189, 121) and radius 56.
; PLAN: r0=189(x), r1=121(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 121
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
