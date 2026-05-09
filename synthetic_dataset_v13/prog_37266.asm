; DESCRIPTION: Creates a red circular shape at (75, 134) with radius 67.
; PLAN: r0=75(x), r1=134(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 134
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
