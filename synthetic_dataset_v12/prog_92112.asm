; DESCRIPTION: Creates a magenta circular shape at (118, 143) with radius 41.
; PLAN: r0=118(x), r1=143(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 143
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
