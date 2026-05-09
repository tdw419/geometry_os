; DESCRIPTION: Places a red circle of radius 64 at center (227, 134).
; PLAN: r0=227(x), r1=134(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 134
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
