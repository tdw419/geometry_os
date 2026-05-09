; DESCRIPTION: Creates a white rectangular region at (375, 28) spanning 72 by 53 pixels.
; PLAN: r0=375(x), r1=28(y), r2=72(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 28
LDI r2, 72
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
