; DESCRIPTION: Creates a white rectangular region at (131, 183) spanning 102 by 43 pixels.
; PLAN: r0=131(x), r1=183(y), r2=102(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 183
LDI r2, 102
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
