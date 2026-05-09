; DESCRIPTION: Creates a orange circular shape at (59, 210) with radius 28.
; PLAN: r0=59(x), r1=210(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 210
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
