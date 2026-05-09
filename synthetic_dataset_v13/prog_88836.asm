; DESCRIPTION: Creates a white rectangular region at (257, 71) spanning 57 by 32 pixels.
; PLAN: r0=257(x), r1=71(y), r2=57(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 71
LDI r2, 57
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
