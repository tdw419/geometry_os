; DESCRIPTION: Creates a white circular shape at (193, 182) with radius 63.
; PLAN: r0=193(x), r1=182(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 182
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
