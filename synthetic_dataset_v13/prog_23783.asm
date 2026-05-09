; DESCRIPTION: Creates a orange circular shape at (425, 173) with radius 30.
; PLAN: r0=425(x), r1=173(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 173
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
