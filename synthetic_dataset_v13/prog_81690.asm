; DESCRIPTION: Renders a red disk with center (32, 58) and radius 18.
; PLAN: r0=32(x), r1=58(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 58
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
