; DESCRIPTION: Creates a white rectangular region at (47, 58) spanning 28 by 73 pixels.
; PLAN: r0=47(x), r1=58(y), r2=28(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 58
LDI r2, 28
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
