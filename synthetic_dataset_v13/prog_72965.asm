; DESCRIPTION: Creates a white rectangular region at (131, 76) spanning 49 by 81 pixels.
; PLAN: r0=131(x), r1=76(y), r2=49(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 76
LDI r2, 49
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
