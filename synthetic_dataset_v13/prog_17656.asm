; DESCRIPTION: Creates a white rectangular region at (381, 98) spanning 64 by 19 pixels.
; PLAN: r0=381(x), r1=98(y), r2=64(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 98
LDI r2, 64
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
