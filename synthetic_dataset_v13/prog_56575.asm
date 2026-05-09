; DESCRIPTION: Creates a red circular shape at (74, 114) with radius 28.
; PLAN: r0=74(x), r1=114(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 114
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
