; DESCRIPTION: Renders a red disk with center (76, 64) and radius 36.
; PLAN: r0=76(x), r1=64(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 64
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
