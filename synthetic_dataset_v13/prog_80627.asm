; DESCRIPTION: Creates a white rectangular region at (15, 57) spanning 52 by 64 pixels.
; PLAN: r0=15(x), r1=57(y), r2=52(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 57
LDI r2, 52
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
