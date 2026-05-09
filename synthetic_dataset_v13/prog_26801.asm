; DESCRIPTION: Creates a white rectangular region at (379, 3) spanning 115 by 95 pixels.
; PLAN: r0=379(x), r1=3(y), r2=115(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 3
LDI r2, 115
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
