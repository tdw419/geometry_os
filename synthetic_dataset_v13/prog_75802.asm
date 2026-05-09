; DESCRIPTION: Creates a orange circular shape at (305, 143) with radius 61.
; PLAN: r0=305(x), r1=143(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 143
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
