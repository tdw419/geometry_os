; DESCRIPTION: Creates a black circular shape at (368, 221) with radius 27.
; PLAN: r0=368(x), r1=221(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 221
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
