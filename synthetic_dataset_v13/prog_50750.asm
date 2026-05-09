; DESCRIPTION: Creates a white rectangular region at (71, 56) spanning 69 by 28 pixels.
; PLAN: r0=71(x), r1=56(y), r2=69(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 56
LDI r2, 69
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
