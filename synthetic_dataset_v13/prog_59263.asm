; DESCRIPTION: Creates a orange circular shape at (27, 206) with radius 11.
; PLAN: r0=27(x), r1=206(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 206
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
