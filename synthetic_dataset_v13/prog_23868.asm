; DESCRIPTION: Creates a white rectangular region at (437, 143) spanning 62 by 62 pixels.
; PLAN: r0=437(x), r1=143(y), r2=62(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 143
LDI r2, 62
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
