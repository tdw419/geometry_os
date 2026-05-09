; DESCRIPTION: Creates a orange circular shape at (433, 222) with radius 32.
; PLAN: r0=433(x), r1=222(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 222
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
