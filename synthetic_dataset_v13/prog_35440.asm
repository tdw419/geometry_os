; DESCRIPTION: Creates a orange circular shape at (273, 79) with radius 64.
; PLAN: r0=273(x), r1=79(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 79
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
