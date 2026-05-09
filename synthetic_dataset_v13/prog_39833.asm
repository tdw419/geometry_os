; DESCRIPTION: Creates a white rectangular region at (53, 23) spanning 19 by 92 pixels.
; PLAN: r0=53(x), r1=23(y), r2=19(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 23
LDI r2, 19
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
