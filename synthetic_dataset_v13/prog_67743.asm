; DESCRIPTION: Creates a white rectangular region at (108, 53) spanning 102 by 66 pixels.
; PLAN: r0=108(x), r1=53(y), r2=102(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 53
LDI r2, 102
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
