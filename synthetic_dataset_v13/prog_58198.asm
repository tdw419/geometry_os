; DESCRIPTION: Creates a white rectangular region at (341, 52) spanning 115 by 53 pixels.
; PLAN: r0=341(x), r1=52(y), r2=115(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 52
LDI r2, 115
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
