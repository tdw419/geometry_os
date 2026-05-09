; DESCRIPTION: Creates a cyan circular shape at (376, 165) with radius 65.
; PLAN: r0=376(x), r1=165(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 165
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
