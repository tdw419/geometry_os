; DESCRIPTION: Creates a magenta circular shape at (166, 186) with radius 41.
; PLAN: r0=166(x), r1=186(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 186
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
