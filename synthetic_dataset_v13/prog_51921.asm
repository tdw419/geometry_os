; DESCRIPTION: Renders a white disk with center (247, 156) and radius 58.
; PLAN: r0=247(x), r1=156(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 156
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
