; DESCRIPTION: Places a black circle of radius 30 at center (168, 95).
; PLAN: r0=168(x), r1=95(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 95
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
