; DESCRIPTION: Creates a orange circular shape at (74, 57) with radius 27.
; PLAN: r0=74(x), r1=57(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 57
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
