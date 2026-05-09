; DESCRIPTION: Creates a orange circular shape at (176, 126) with radius 36.
; PLAN: r0=176(x), r1=126(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 126
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
