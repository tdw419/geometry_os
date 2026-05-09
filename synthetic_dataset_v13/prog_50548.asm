; DESCRIPTION: Creates a white rectangular region at (311, 19) spanning 64 by 56 pixels.
; PLAN: r0=311(x), r1=19(y), r2=64(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 19
LDI r2, 64
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
