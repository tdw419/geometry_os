; DESCRIPTION: Creates a white rectangular region at (383, 156) spanning 53 by 70 pixels.
; PLAN: r0=383(x), r1=156(y), r2=53(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 156
LDI r2, 53
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
