; DESCRIPTION: Creates a red circular shape at (445, 114) with radius 64.
; PLAN: r0=445(x), r1=114(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 114
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
