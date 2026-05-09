; DESCRIPTION: Creates a black circular shape at (202, 175) with radius 42.
; PLAN: r0=202(x), r1=175(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 175
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
