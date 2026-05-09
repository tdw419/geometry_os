; DESCRIPTION: Creates a white rectangular region at (62, 105) spanning 113 by 31 pixels.
; PLAN: r0=62(x), r1=105(y), r2=113(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 105
LDI r2, 113
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
