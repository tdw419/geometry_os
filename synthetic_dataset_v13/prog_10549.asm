; DESCRIPTION: Creates a white rectangular region at (257, 49) spanning 61 by 98 pixels.
; PLAN: r0=257(x), r1=49(y), r2=61(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 49
LDI r2, 61
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
