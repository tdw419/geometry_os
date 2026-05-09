; DESCRIPTION: Creates a orange circular shape at (475, 104) with radius 32.
; PLAN: r0=475(x), r1=104(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 104
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
