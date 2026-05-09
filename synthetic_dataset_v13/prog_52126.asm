; DESCRIPTION: Composite: Creates a magenta circular shape at (346, 67) with radius 61 then Sets a single white pixel at (300, 46).
; PLAN: r0=346(x), r1=67(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=46(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 67
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 46
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
