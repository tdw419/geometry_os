; DESCRIPTION: Creates a red circular shape at (183, 220) with radius 14.
; PLAN: r0=183(x), r1=220(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 220
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
