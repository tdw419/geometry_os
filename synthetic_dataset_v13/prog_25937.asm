; DESCRIPTION: Creates a orange circular shape at (385, 182) with radius 24.
; PLAN: r0=385(x), r1=182(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 182
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
