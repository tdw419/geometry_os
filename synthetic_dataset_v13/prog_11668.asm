; DESCRIPTION: Renders a green disk with center (338, 102) and radius 58.
; PLAN: r0=338(x), r1=102(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 102
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
