; DESCRIPTION: Creates a white rectangular region at (432, 143) spanning 24 by 88 pixels.
; PLAN: r0=432(x), r1=143(y), r2=24(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 143
LDI r2, 24
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
