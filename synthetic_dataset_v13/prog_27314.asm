; DESCRIPTION: Creates a white rectangular region at (128, 56) spanning 75 by 102 pixels.
; PLAN: r0=128(x), r1=56(y), r2=75(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 56
LDI r2, 75
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
