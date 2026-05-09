; DESCRIPTION: Creates a orange circular shape at (75, 73) with radius 59.
; PLAN: r0=75(x), r1=73(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 73
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
