; DESCRIPTION: Creates a white rectangular region at (14, 31) spanning 14 by 96 pixels.
; PLAN: r0=14(x), r1=31(y), r2=14(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 31
LDI r2, 14
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
