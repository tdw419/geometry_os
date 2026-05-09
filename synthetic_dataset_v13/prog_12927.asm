; DESCRIPTION: Creates a red circular shape at (174, 72) with radius 39.
; PLAN: r0=174(x), r1=72(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 72
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
