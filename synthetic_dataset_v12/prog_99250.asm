; DESCRIPTION: Creates a orange circular shape at (426, 65) with radius 54.
; PLAN: r0=426(x), r1=65(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 65
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
