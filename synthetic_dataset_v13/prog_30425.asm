; DESCRIPTION: Creates a orange circular shape at (307, 167) with radius 74.
; PLAN: r0=307(x), r1=167(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 167
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
