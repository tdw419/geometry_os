; DESCRIPTION: Creates a orange circular shape at (400, 92) with radius 16.
; PLAN: r0=400(x), r1=92(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 92
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
