; DESCRIPTION: Renders a red disk with center (32, 191) and radius 26.
; PLAN: r0=32(x), r1=191(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 191
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
