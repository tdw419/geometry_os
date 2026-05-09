; DESCRIPTION: Renders a red disk with center (238, 128) and radius 75.
; PLAN: r0=238(x), r1=128(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 128
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
