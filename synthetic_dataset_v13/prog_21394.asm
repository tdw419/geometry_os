; DESCRIPTION: Creates a white rectangular region at (358, 122) spanning 62 by 83 pixels.
; PLAN: r0=358(x), r1=122(y), r2=62(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 122
LDI r2, 62
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
