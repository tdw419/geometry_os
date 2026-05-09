; DESCRIPTION: Creates a orange circular shape at (209, 46) with radius 42.
; PLAN: r0=209(x), r1=46(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 46
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
