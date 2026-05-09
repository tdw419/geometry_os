; DESCRIPTION: Creates a red circular shape at (463, 187) with radius 39.
; PLAN: r0=463(x), r1=187(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 187
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
