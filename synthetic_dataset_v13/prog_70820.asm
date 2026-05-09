; DESCRIPTION: Creates a white rectangular region at (379, 90) spanning 39 by 112 pixels.
; PLAN: r0=379(x), r1=90(y), r2=39(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 90
LDI r2, 39
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
