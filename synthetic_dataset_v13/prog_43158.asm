; DESCRIPTION: Creates a red circular shape at (368, 103) with radius 36.
; PLAN: r0=368(x), r1=103(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 103
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
