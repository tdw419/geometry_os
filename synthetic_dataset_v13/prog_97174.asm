; DESCRIPTION: Renders a black disk with center (102, 208) and radius 16.
; PLAN: r0=102(x), r1=208(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 208
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
