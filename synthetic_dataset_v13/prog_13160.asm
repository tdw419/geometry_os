; DESCRIPTION: Renders a green disk with center (131, 177) and radius 62.
; PLAN: r0=131(x), r1=177(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 177
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
