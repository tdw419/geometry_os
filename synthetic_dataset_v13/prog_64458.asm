; DESCRIPTION: Places a orange circle of radius 42 at center (447, 53).
; PLAN: r0=447(x), r1=53(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 53
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
