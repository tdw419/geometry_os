; DESCRIPTION: Creates a white rectangular region at (266, 23) spanning 28 by 69 pixels.
; PLAN: r0=266(x), r1=23(y), r2=28(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 23
LDI r2, 28
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
