; DESCRIPTION: Creates a white rectangular region at (447, 122) spanning 12 by 73 pixels.
; PLAN: r0=447(x), r1=122(y), r2=12(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 122
LDI r2, 12
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
