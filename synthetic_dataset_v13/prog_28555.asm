; DESCRIPTION: Renders a green disk with center (452, 184) and radius 60.
; PLAN: r0=452(x), r1=184(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 184
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
