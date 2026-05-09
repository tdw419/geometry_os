; DESCRIPTION: Creates a white rectangular region at (384, 143) spanning 96 by 110 pixels.
; PLAN: r0=384(x), r1=143(y), r2=96(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 143
LDI r2, 96
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
