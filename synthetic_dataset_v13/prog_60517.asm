; DESCRIPTION: Creates a orange circular shape at (117, 228) with radius 21.
; PLAN: r0=117(x), r1=228(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 228
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
