; DESCRIPTION: Creates a white rectangular region at (257, 31) spanning 60 by 81 pixels.
; PLAN: r0=257(x), r1=31(y), r2=60(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 31
LDI r2, 60
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
