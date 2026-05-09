; DESCRIPTION: Creates a red circular shape at (187, 221) with radius 15.
; PLAN: r0=187(x), r1=221(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 221
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
