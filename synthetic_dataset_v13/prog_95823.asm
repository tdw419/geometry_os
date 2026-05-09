; DESCRIPTION: Creates a white circular shape at (327, 213) with radius 36.
; PLAN: r0=327(x), r1=213(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 213
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
