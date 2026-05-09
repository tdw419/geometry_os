; DESCRIPTION: Draws a white circle centered at (368, 158) with radius 64.
; PLAN: r0=368(x), r1=158(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 158
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
