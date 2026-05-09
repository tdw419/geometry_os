; DESCRIPTION: Creates a red circular shape at (370, 151) with radius 43.
; PLAN: r0=370(x), r1=151(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 151
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
