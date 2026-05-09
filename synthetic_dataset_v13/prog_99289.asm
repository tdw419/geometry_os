; DESCRIPTION: Creates a white rectangular region at (102, 53) spanning 61 by 88 pixels.
; PLAN: r0=102(x), r1=53(y), r2=61(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 53
LDI r2, 61
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
