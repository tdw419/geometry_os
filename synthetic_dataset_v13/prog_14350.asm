; DESCRIPTION: Renders a red disk with center (256, 89) and radius 62.
; PLAN: r0=256(x), r1=89(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 89
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
